import Combine
import Foundation

class BaseClient: BaseClientProtocol {

    private let baseURL: String
    private let apiKey: String
    private let urlSession: URLSession

    init(baseURL: String, apiKey: String, urlSession: URLSession) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.urlSession = urlSession
    }

    func get<ResponseType: Decodable, ResultType>(
        path: String,
        itemsKeyPath: KeyPath<ResponseType, ResultType>,
        params: [String : String]
    ) -> AnyPublisher<ResultType, Error> {
        guard let url = buildUrl(path: path, params: params) else {
            return Empty<ResultType, Error>().eraseToAnyPublisher()
        }

        return urlSession
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard
                    let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200
                else {
                    throw ResponseError.badServerResponse
                }

                return element.data
            }
            .decode(type: ResponseType.self, decoder: JSONDecoder())
            .map { $0[keyPath: itemsKeyPath] }
            .eraseToAnyPublisher()
    }

    private func buildUrl(path: String, params: [String: String]) -> URL? {
        var urlString = "\(baseURL)\(path)?\(apiKey)"

        if !params.isEmpty {
            urlString += "&\(buildParams(params))"
        }

        let url = URL(string: "\(urlString)")

        return url
    }

    private func buildParams(_ params: [String: String]) -> String {
        params
            .map { key, value -> String in
                if key.isEmpty {
                    return value
                } else {
                    return "&\(key)=\(value)"
                }
            }
            .joined()
    }

}

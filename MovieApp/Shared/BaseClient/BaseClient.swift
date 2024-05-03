import Combine
import Foundation

class BaseClient: BaseClientProtocol {

    func exec<ResponseType: Decodable, ResultType>(
        itemsKeyPath: KeyPath<ResponseType, ResultType>,
        requestType: RequestType,
        params: [String]
    ) -> AnyPublisher<ResultType, Error> {
        guard
            let url = buildRequestURL(requestType: requestType, params: params)
        else {
            return Empty<ResultType, Error>().eraseToAnyPublisher()
        }

        return get(itemsKeyPath: itemsKeyPath, url: url)
    }

    private func get<ResponseType: Decodable, ResultType>(
        itemsKeyPath: KeyPath<ResponseType, ResultType>,
        url: URL
    ) -> AnyPublisher<ResultType, Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard
                    let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200
                else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: ResponseType.self, decoder: JSONDecoder())
            .map { $0[keyPath: itemsKeyPath] }
            .eraseToAnyPublisher()
    }

    private func buildRequestURL(requestType: RequestType, params: [String]) -> URL? {
        URL(string: String(format: requestPath(requestType: requestType), arguments: params))
    }

    private func requestPath(requestType: RequestType) -> String {
        switch requestType {
        case .getPopular:
            return APIConstants.baseURL + APIConstants.popularEndpoint + APIConstants.apiKey
        case .getTopRated:
            return APIConstants.baseURL + APIConstants.topRatedEndpoint + APIConstants.apiKey
        case .getTrending:
            return APIConstants.baseURL + APIConstants.trendingEndpoint + APIConstants.apiKey
        case .getMovie:
            return APIConstants.baseURL + APIConstants.movieEndpoint + APIConstants.apiKey
        case .getCast:
            return APIConstants.baseURL + APIConstants.castEndpoint + APIConstants.apiKey
        case .getReview:
            return APIConstants.baseURL + APIConstants.reviewEndpoint + APIConstants.apiKey
        case .getRecommended:
            return APIConstants.baseURL + APIConstants.recommendedEndpoint + APIConstants.apiKey
        case .getSearchMovie:
            return APIConstants.baseURL + APIConstants.searchEndpoint
        }
    }

}

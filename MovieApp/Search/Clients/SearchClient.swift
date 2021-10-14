import Combine
import Foundation

class SearchClient: SearchClientProtocol {

    func searchMovies(query: String) -> AnyPublisher<[SearchResponse], Error> {
        guard
            let url = URL(string: buildRequestPath(requestPathTemplate: APIConstants.searchURL, query: query))
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return fetchDetail(itemsKeyPath: \SearchNetworkResponse.response, url: url)
    }

    private func fetchDetail<ResponseType: Decodable, ResultType>(
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

    private func buildRequestPath(requestPathTemplate: String, query: String) -> String {
        requestPathTemplate + query.replacingOccurrences(of: " ", with: "%20")
    }

}

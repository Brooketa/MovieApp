import Combine
import Foundation

class FavoritesClient: FavoritesClientProtocol {

    func fetchFavoriteMovie(movieID: Int) -> AnyPublisher<FavoritesMovieResponse, Error> {
        guard
            let url = URL(string: buildRequestPath(requestPathTemplate: APIConstants.movieURL, movieID: movieID))
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return fetchDetail(itemsKeyPath: \FavoritesMovieResponse.self, url: url)
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

    private func buildRequestPath(requestPathTemplate: String, movieID: Int) -> String {
        String(format: requestPathTemplate, movieID)
    }

}

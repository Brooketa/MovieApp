import Combine
import Foundation

class MovieClient: MovieClientProtocol {

    func fetchPopularMovies() -> AnyPublisher<[MovieClientModel], Error> {
        guard let url = URL(string: APIConstants.popularURL) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared
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
            .decode(type: MovieNetworkModel.self, decoder: JSONDecoder())
            .map { $0.response }
            .eraseToAnyPublisher()
    }

    func fetchTopRatedMovies() -> AnyPublisher<[MovieClientModel], Error> {
        guard let url = URL(string: APIConstants.topRatedURL) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared
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
            .decode(type: MovieNetworkModel.self, decoder: JSONDecoder())
            .map { $0.response }
            .eraseToAnyPublisher()
    }

    func fetchTrendingMovies() -> AnyPublisher<[MovieClientModel], Error> {
        guard let url = URL(string: APIConstants.trendingURL) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared
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
            .decode(type: MovieNetworkModel.self, decoder: JSONDecoder())
            .map { $0.response }
            .eraseToAnyPublisher()
    }

}

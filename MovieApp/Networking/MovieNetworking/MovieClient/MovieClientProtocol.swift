import Combine

protocol MovieClientProtocol {

    func fetchPopularMovies() -> AnyPublisher<[MovieClientModel], Error>

    func fetchTopRatedMovies() -> AnyPublisher<[MovieClientModel], Error>

    func fetchTrendingMovies() -> AnyPublisher<[MovieClientModel], Error>

}

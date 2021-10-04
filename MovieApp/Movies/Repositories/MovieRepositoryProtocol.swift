import Combine

protocol MovieRepositoryProtocol {

    func fetchPopularMovies() -> AnyPublisher<[MovieRepositoryModel], Error>

    func fetchTopRatedMovies() -> AnyPublisher<[MovieRepositoryModel], Error>

    func fetchTrendingMovies() -> AnyPublisher<[MovieRepositoryModel], Error>

}

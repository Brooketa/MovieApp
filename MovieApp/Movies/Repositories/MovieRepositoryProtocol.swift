import Combine

protocol MovieRepositoryProtocol {

    func fetchPopularMovies() -> AnyPublisher<[MovieRepositoryModel], Never>

    func fetchTopRatedMovies() -> AnyPublisher<[MovieRepositoryModel], Never>

    func fetchTrendingMovies() -> AnyPublisher<[MovieRepositoryModel], Never>

    func toggleFavorite(movieID: Int)

}

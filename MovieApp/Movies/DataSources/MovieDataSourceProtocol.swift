import Combine

protocol MovieDataSourceProtocol {

    func fetchPopularMovies() -> AnyPublisher<[MovieDataSourceModel], Error>

    func fetchTopRatedMovies() -> AnyPublisher<[MovieDataSourceModel], Error>

    func fetchTrendingMovies() -> AnyPublisher<[MovieDataSourceModel], Error>

}

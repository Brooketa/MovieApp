import Combine

protocol MovieDataSourceProtocol {

    func fetchPopularMovies() -> AnyPublisher<[MovieDataSourceModel], Error>

}

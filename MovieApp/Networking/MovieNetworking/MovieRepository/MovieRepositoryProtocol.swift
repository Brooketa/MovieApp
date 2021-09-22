import Combine

protocol MovieRepositoryProtocol {

    func fetchPopularMovies() -> AnyPublisher<[MovieRepositoryModel], Error>

}

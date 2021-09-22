import Combine

protocol MovieClientProtocol {

    func fetchPopularMovies() -> AnyPublisher<[MovieClientModel], Error>

}

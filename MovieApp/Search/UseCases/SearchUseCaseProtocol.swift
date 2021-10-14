import Combine

protocol SearchUseCaseProtocol {

    func searchMovies(query: String) -> AnyPublisher<[SearchUseCaseModel], Error>

}

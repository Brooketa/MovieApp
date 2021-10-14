import Combine

protocol SearchRepositoryProtocol {

    func searchMovies(query: String) -> AnyPublisher<[SearchRepositoryModel], Error>

}

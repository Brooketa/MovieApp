import Combine

protocol SearchClientProtocol {

    func searchMovies(query: String) -> AnyPublisher<[SearchResponse], Error>

}

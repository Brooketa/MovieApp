import Combine

protocol SearchDataSourceProtocol {

    func searchMovies(query: String) -> AnyPublisher<[SearchDataModel], Error>

}

import Combine

class SearchDataSource: SearchDataSourceProtocol {

    private let searchClient: SearchClientProtocol

    init(searchClient: SearchClientProtocol) {
        self.searchClient = searchClient
    }

    func searchMovies(query: String) -> AnyPublisher<[SearchDataModel], Error> {
        searchClient
            .searchMovies(query: query)
            .map { $0.map { SearchDataModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}

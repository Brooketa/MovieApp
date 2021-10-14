import Combine

class SearchRepository: SearchRepositoryProtocol {

    private let searchDataSource: SearchDataSourceProtocol

    init(searchDataSource: SearchDataSourceProtocol) {
        self.searchDataSource = searchDataSource
    }

    func searchMovies(query: String) -> AnyPublisher<[SearchRepositoryModel], Error> {
        searchDataSource
            .searchMovies(query: query)
            .map { $0.map { SearchRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}

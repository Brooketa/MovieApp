import Combine

class SearchUseCase: SearchUseCaseProtocol {

    private let searchRepository: SearchRepositoryProtocol

    init(searchRepository: SearchRepositoryProtocol) {
        self.searchRepository = searchRepository
    }

    func searchMovies(query: String) -> AnyPublisher<[SearchUseCaseModel], Error> {
        searchRepository
            .searchMovies(query: query)
            .map { $0.map { SearchUseCaseModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}

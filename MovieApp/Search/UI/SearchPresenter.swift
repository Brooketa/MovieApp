import Combine
import UIKit

class SearchPresenter: NSObject {

    private let searchUseCase: SearchUseCase

    public func searchMovies(query: String) -> AnyPublisher<[SearchMovieViewModel], Never> {
        searchUseCase
            .searchMovies(query: query)
            .replaceError(with: [])
            .map { $0.map { SearchMovieViewModel(with: $0) } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
    }

}

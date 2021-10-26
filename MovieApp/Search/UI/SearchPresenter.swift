import Combine
import UIKit

class SearchPresenter {

    private let searchUseCase: SearchUseCase
    private let appRouter: AppRouterProtocol

    init(searchUseCase: SearchUseCase, appRouter: AppRouterProtocol) {
        self.appRouter = appRouter
        self.searchUseCase = searchUseCase
    }

    public func searchMovies(query: String) -> AnyPublisher<[SearchMovieViewModel], Never> {
        searchUseCase
            .searchMovies(query: query)
            .replaceError(with: [])
            .map { $0.map { SearchMovieViewModel(with: $0) } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func showDetails(movieID: Int) {
        appRouter.showDetails(movieID: movieID)
    }
}

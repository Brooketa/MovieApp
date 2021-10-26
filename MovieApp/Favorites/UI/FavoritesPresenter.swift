import Combine
import Foundation

class FavoritesPresenter {

    private let favoritesUseCase: FavoritesUseCaseProtocol
    private let appRouter: AppRouterProtocol

    var favoriteMovies: AnyPublisher<FavoritesMovieViewModel, Error> {
        favoritesUseCase
            .fetchFavoriteMovies
            .map { FavoritesMovieViewModel(from: $0) }
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()
    }

    init(favoritesUseCase: FavoritesUseCaseProtocol, appRouter: AppRouterProtocol) {
        self.favoritesUseCase = favoritesUseCase
        self.appRouter = appRouter
    }

    func toggleFavoriteMovie(movieID: Int) {
        favoritesUseCase.toggleFavoriteMovie(movieID: movieID)
    }

    func showDetails(movieID: Int) {
        appRouter.showDetails(movieID: movieID)
    }

}

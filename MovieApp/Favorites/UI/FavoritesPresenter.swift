import Combine
import Foundation

class FavoritesPresenter {

    private let favoritesUseCase: FavoritesUseCaseProtocol

    var favoriteMovies: AnyPublisher<FavoritesMovieViewModel, Error> {
        favoritesUseCase
            .fetchFavoriteMovies
            .map { FavoritesMovieViewModel(from: $0) }
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()
    }

    init(favoritesUseCase: FavoritesUseCaseProtocol) {
        self.favoritesUseCase = favoritesUseCase
    }

    func toggleFavoriteMovie(movieID: Int) {
        favoritesUseCase.toggleFavoriteMovie(movieID: movieID)
    }

}

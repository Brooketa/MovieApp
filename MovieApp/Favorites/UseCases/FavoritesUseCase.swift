import Combine

class FavoritesUseCase: FavoritesUseCaseProtocol {

    private let favoritesRepository: FavoritesRepositoryProtocol

    init(favoritesRepository: FavoritesRepositoryProtocol) {
        self.favoritesRepository = favoritesRepository
    }

    var fetchFavoriteMovies: AnyPublisher<FavoritesMovieUseCaseModel, Error> {
        favoritesRepository
            .fetchFavoriteMovies
            .map { FavoritesMovieUseCaseModel(from: $0) }
            .eraseToAnyPublisher()
    }

    func toggleFavoriteMovie(movieID: Int) {
        favoritesRepository.toggleFavoriteMovie(movieID: movieID)
    }

}

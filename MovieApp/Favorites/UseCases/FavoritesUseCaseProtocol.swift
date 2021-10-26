import Combine

protocol FavoritesUseCaseProtocol {

    var fetchFavoriteMovies: AnyPublisher<FavoritesMovieUseCaseModel, Error> { get }

    func toggleFavoriteMovie(movieID: Int)

}

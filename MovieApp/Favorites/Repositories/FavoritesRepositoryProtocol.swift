import Combine

protocol FavoritesRepositoryProtocol {

    var fetchFavoriteMovies: AnyPublisher<[FavoritesMovieRepositoryModel], Error> { get }

    func toggleFavoriteMovie(movieID: Int)

}

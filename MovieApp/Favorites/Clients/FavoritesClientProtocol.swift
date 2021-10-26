import Combine

protocol FavoritesClientProtocol {

    func fetchFavoriteMovie(movieID: Int) -> AnyPublisher<FavoritesMovieResponse, Error>

}

import Combine

protocol FavoritesDataSourceProtocol {

    func fetchFavoriteMovie(movieID: Int) -> AnyPublisher<FavoritesMovieDataModel, Error>

}

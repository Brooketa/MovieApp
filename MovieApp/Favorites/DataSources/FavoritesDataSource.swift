import Combine
import Foundation

class FavoritesDataSource: FavoritesDataSourceProtocol {

    private let favoritesClient: FavoritesClientProtocol

    init(favoritesClient: FavoritesClientProtocol) {
        self.favoritesClient = favoritesClient
    }

    func fetchFavoriteMovie(movieID: Int) -> AnyPublisher<FavoritesMovieDataModel, Error> {
        favoritesClient
            .fetchFavoriteMovie(movieID: movieID)
            .map { FavoritesMovieDataModel(from: $0) }
            .eraseToAnyPublisher()
    }

}

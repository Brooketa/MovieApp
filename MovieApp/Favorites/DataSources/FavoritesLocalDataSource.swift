import Combine
import Foundation

class FavoritesLocalDataSource: FavoritesLocalDataSourceProtocol {

    var favorites: AnyPublisher<[Int], Never> {
        UserDefaults
            .standard
            .publisher(for: \.favorites)
            .eraseToAnyPublisher()
    }

    func toggleFavorite(movieID: Int) {
        var favoritesIDs = UserDefaults.standard.favorites

        if let index = favoritesIDs.firstIndex(of: movieID) {
            favoritesIDs.remove(at: index)
        } else {
            favoritesIDs.append(movieID)
        }

        UserDefaults.standard.favorites = favoritesIDs
    }

}

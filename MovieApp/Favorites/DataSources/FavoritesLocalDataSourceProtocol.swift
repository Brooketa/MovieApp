import Combine

protocol FavoritesLocalDataSourceProtocol {

    var favorites: AnyPublisher<[Int], Never> { get }

    func toggleFavorite(movieID: Int)

}

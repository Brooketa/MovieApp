import Combine

class FavoritesRepository: FavoritesRepositoryProtocol {

    private let favoritesDataSource: FavoritesDataSourceProtocol
    private let favoritesLocalDataSource: FavoritesLocalDataSourceProtocol

    init(favoritesDataSource: FavoritesDataSourceProtocol, favoritesLocalDataSource: FavoritesLocalDataSourceProtocol) {
        self.favoritesDataSource = favoritesDataSource
        self.favoritesLocalDataSource = favoritesLocalDataSource
    }

    var fetchFavoriteMovies: AnyPublisher<[FavoritesMovieRepositoryModel], Error> {
        favoritesLocalDataSource
            .favorites
            .map { [weak self] favoriteIDs -> AnyPublisher<[FavoritesMovieRepositoryModel], Error> in
                guard
                    let self = self
                else {
                    return Empty<[FavoritesMovieRepositoryModel], Error>().eraseToAnyPublisher()
                }

                let favoriteMovies = favoriteIDs.map {
                    self.favoritesDataSource
                        .fetchFavoriteMovie(movieID: $0)
                        .map { FavoritesMovieRepositoryModel(from: $0) }
                        .eraseToAnyPublisher()
                }

                return Publishers
                    .MergeMany(favoriteMovies)
                    .collect()
                    .eraseToAnyPublisher()
            }
            .switchToLatest()
            .eraseToAnyPublisher()
    }

    func toggleFavoriteMovie(movieID: Int) {
        favoritesLocalDataSource.toggleFavorite(movieID: movieID)
    }

}

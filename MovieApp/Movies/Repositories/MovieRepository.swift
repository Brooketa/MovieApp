import Combine

class MovieRepository: MovieRepositoryProtocol {

    private let movieDataSource: MovieDataSourceProtocol
    private let favoritesDataSource: FavoritesLocalDataSourceProtocol

    init(movieDataSource: MovieDataSourceProtocol, favoritesDataSource: FavoritesLocalDataSourceProtocol) {
        self.movieDataSource = movieDataSource
        self.favoritesDataSource = favoritesDataSource
    }

    func fetchPopularMovies() -> AnyPublisher<[MovieRepositoryModel], Never> {
        movieDataSource
            .fetchPopularMovies()
            .replaceError(with: [])
            .combineLatest(favoritesDataSource.favorites)
            .compactMap { [weak self] popularMovies, favorites in
                guard let self = self else { return nil }

                return self.update(movies: popularMovies, favorites: favorites)
            }
            .eraseToAnyPublisher()
    }

    func fetchTopRatedMovies() -> AnyPublisher<[MovieRepositoryModel], Never> {
        movieDataSource
            .fetchTopRatedMovies()
            .replaceError(with: [])
            .combineLatest(favoritesDataSource.favorites)
            .compactMap { [weak self] topRatedMovies, favorites in
                guard let self = self else { return nil }

                return self.update(movies: topRatedMovies, favorites: favorites)
            }
            .eraseToAnyPublisher()
    }

    func fetchTrendingMovies() -> AnyPublisher<[MovieRepositoryModel], Never> {
        movieDataSource
            .fetchTrendingMovies()
            .replaceError(with: [])
            .combineLatest(favoritesDataSource.favorites)
            .compactMap { [weak self] trendingMovies, favorites in
                guard let self = self else { return nil }

                return self.update(movies: trendingMovies, favorites: favorites)
            }
            .eraseToAnyPublisher()
    }

    private func update(movies: [MovieDataSourceModel], favorites: [Int]) -> [MovieRepositoryModel] {
        movies.compactMap { dataModel in
            let isFavorite = favorites.contains(dataModel.movieID)

            return MovieRepositoryModel(from: dataModel, isFavorite: isFavorite)
        }
    }

    func toggleFavorite(movieID: Int) {
        favoritesDataSource.toggleFavorite(movieID: movieID)
    }

}

import Combine

class MovieRepository: MovieRepositoryProtocol {

    private let movieDataSource: MovieDataSourceProtocol

    func fetchPopularMovies() -> AnyPublisher<[MovieRepositoryModel], Error> {
        movieDataSource
            .fetchPopularMovies()
            .map { $0.map { MovieRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchTopRatedMovies() -> AnyPublisher<[MovieRepositoryModel], Error> {
        movieDataSource
            .fetchTopRatedMovies()
            .map { $0.map { MovieRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchTrendingMovies() -> AnyPublisher<[MovieRepositoryModel], Error> {
        movieDataSource
            .fetchTrendingMovies()
            .map { $0.map { MovieRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    init(movieDataSource: MovieDataSourceProtocol) {
        self.movieDataSource = movieDataSource
    }

}

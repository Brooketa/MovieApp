import Combine

class MovieRepository: MovieRepositoryProtocol {

    private let movieDataSource: MovieDataSourceProtocol

    func fetchPopularMovies() -> AnyPublisher<[MovieRepositoryModel], Error> {
        movieDataSource
            .fetchPopularMovies()
            .map { $0.map { MovieRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    init(movieDataSource: MovieDataSourceProtocol) {
        self.movieDataSource = movieDataSource
    }

}

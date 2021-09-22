import Combine

class MovieDataSource: MovieDataSourceProtocol {

    private let movieClient: MovieClientProtocol

    func fetchPopularMovies() -> AnyPublisher<[MovieDataSourceModel], Error> {
        movieClient
                .fetchPopularMovies()
                .map { $0.map { MovieDataSourceModel(from: $0) } }
                .eraseToAnyPublisher()
    }

    init(movieClient: MovieClientProtocol) {
        self.movieClient = movieClient
    }

}

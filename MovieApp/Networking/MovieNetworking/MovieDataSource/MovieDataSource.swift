import Combine

class MovieDataSource: MovieDataSourceProtocol {

    private let movieClient: MovieClient

    var trendingMovies: AnyPublisher<[MovieDataSourceModel], Error> {
        movieClient
            .trendingMovies
            .map { $0.map { MovieDataSourceModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    init(movieClient: MovieClient) {
        self.movieClient = movieClient
    }

}

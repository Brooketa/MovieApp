import Combine

class MovieRepository: MovieRepositoryProtocol {

    private let movieDataSource: MovieDataSource

    var trendingMovies: AnyPublisher<[MovieRepositoryModel], Error> {
        movieDataSource
            .trendingMovies
            .map { $0.map { MovieRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    init(movieDataSource: MovieDataSource) {
        self.movieDataSource = movieDataSource
    }

}

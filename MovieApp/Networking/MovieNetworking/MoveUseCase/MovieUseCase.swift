import Combine
import Foundation

class MovieUseCase: MovieUseCaseProtocol {

    private let movieRepository: MovieRepository

    var trendingMovies: AnyPublisher<[MovieUseCaseModel], Error> {
        movieRepository
            .trendingMovies
            .map { $0.map { MovieUseCaseModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

}

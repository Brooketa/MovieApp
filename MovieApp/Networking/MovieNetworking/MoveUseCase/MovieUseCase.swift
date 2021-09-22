import Combine

class MovieUseCase: MovieUseCaseProtocol {

    private let movieRepository: MovieRepositoryProtocol

    func fetchPopularMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Error> {
        movieRepository
            .fetchPopularMovies()
            .map { $0.compactMap {
                switch subcategory {
                case .week, .today:
                    return MovieUseCaseModel(from: $0)
                default:
                    if $0.movieGenres.contains(subcategory.rawValue) {
                        return MovieUseCaseModel(from: $0)
                    } else {
                        return nil
                    }
                }
            } }
            .eraseToAnyPublisher()
    }

    init(movieRepository: MovieRepositoryProtocol) {
        self.movieRepository = movieRepository
    }

}

import Combine

class MovieUseCase: MovieUseCaseProtocol {

    private let movieRepository: MovieRepositoryProtocol

    init(movieRepository: MovieRepositoryProtocol) {
        self.movieRepository = movieRepository
    }

    func fetchPopularMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Never> {
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

    func fetchTopRatedMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Never> {
        movieRepository
            .fetchTopRatedMovies()
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

    func fetchTrendingMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Never> {
        movieRepository
            .fetchTrendingMovies()
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

    func toggleFavorite(movieID: Int) {
        movieRepository.toggleFavorite(movieID: movieID)
    }

}

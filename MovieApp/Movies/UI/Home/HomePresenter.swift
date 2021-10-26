import Combine
import UIKit

class HomePresenter: NSObject {

    private let movieUseCase: MovieUseCaseProtocol

    init(movieUseCase: MovieUseCaseProtocol) {
        self.movieUseCase = movieUseCase
    }

    func movies(section: HomeSection, subcategory: Subcategory) -> AnyPublisher<[MovieViewModel], Never> {
        switch section {
        case .whatsPopular:
            return movieUseCase
                .fetchPopularMovies(subcategory: subcategory)
                .map { $0.map { MovieViewModel(with: $0) } }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()

        case .topRated:
            return movieUseCase
                .fetchTopRatedMovies(subcategory: subcategory)
                .map { $0.map { MovieViewModel(with: $0) } }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()

        case .trending:
            return movieUseCase
                .fetchTrendingMovies(subcategory: subcategory)
                .map { $0.map { MovieViewModel(with: $0) } }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    }

    func toggleFavoriteMovie(movieID: Int) {
        movieUseCase.toggleFavorite(movieID: movieID)
    }

}

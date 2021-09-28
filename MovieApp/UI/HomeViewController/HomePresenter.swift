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
                .replaceError(with: [])
                .map { $0.map { MovieViewModel(with: $0) } }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()

        case .topRated:
            return movieUseCase
                .fetchTopRatedMovies(subcategory: subcategory)
                .replaceError(with: [])
                .map { $0.map { MovieViewModel(with: $0) } }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()

        case .trending:
            return movieUseCase
                .fetchTrendingMovies(subcategory: subcategory)
                .replaceError(with: [])
                .map { $0.map { MovieViewModel(with: $0) } }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    }

}

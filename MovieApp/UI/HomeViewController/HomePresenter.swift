import Combine
import UIKit

class HomePresenter: NSObject {

    private let movieUseCase: MovieUseCaseProtocol

    init(movieUseCase: MovieUseCaseProtocol) {
        self.movieUseCase = movieUseCase
    }

    func movies(subcategory: Subcategory) -> AnyPublisher<[MovieViewModel], Never> {
        movieUseCase
            .fetchPopularMovies(subcategory: subcategory)
            .replaceError(with: [])
            .map { $0.map { MovieViewModel(with: $0) } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}

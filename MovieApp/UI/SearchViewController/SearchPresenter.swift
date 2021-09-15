import Combine
import UIKit

class SearchPresenter: NSObject {

    private let movieUseCase: MovieUseCase

    var trendingMovies: AnyPublisher<[MovieViewModel], Never> {
        movieUseCase
            .trendingMovies
            .replaceError(with: [])
            .map { $0.map { MovieViewModel(with: $0) } }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    init(movieUseCase: MovieUseCase) {
        self.movieUseCase = movieUseCase
    }
}

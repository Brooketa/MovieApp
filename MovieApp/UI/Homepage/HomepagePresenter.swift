import Combine
import UIKit

class HomepagePresenter: NSObject {

    var viewModels = [MovieViewModel]()

    var fetchMovies: AnyPublisher<[MovieViewModel], Never> {
            Just(viewModels).eraseToAnyPublisher()
    }
}

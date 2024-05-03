import Combine
import Foundation

class FavoritesClient: FavoritesClientProtocol {

    let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchFavoriteMovie(movieID: Int) -> AnyPublisher<FavoritesMovieResponse, Error> {
        baseClient
            .exec(itemsKeyPath: \FavoritesMovieResponse.self, requestType: .getMovie, params: ["\(movieID)"])
    }

}

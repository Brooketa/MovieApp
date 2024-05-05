import Combine
import Foundation

class FavoritesClient: FavoritesClientProtocol {

    let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchFavoriteMovie(movieID: Int) -> AnyPublisher<FavoritesMovieResponse, Error> {
        baseClient
            .get(path: "\(APIConstants.movieEndpoint)/\(movieID)", itemsKeyPath: \FavoritesMovieResponse.self)
    }

}

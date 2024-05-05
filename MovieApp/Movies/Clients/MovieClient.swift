import Combine
import Foundation

class MovieClient: MovieClientProtocol {

    let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchPopularMovies() -> AnyPublisher<[MovieClientModel], Error> {
        baseClient
            .get(path: APIConstants.popularEndpoint, itemsKeyPath: \MovieNetworkModel.response)
    }

    func fetchTopRatedMovies() -> AnyPublisher<[MovieClientModel], Error> {
        baseClient
            .get(path: APIConstants.topRatedEndpoint, itemsKeyPath: \MovieNetworkModel.response)
    }

    func fetchTrendingMovies() -> AnyPublisher<[MovieClientModel], Error> {
        baseClient
            .get(path: APIConstants.trendingEndpoint, itemsKeyPath: \MovieNetworkModel.response)
    }

}

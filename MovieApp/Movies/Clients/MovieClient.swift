import Combine
import Foundation

class MovieClient: MovieClientProtocol {

    let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchPopularMovies() -> AnyPublisher<[MovieClientModel], Error> {
        baseClient
            .exec(itemsKeyPath: \MovieNetworkModel.response, requestType: .getPopular, params: [String]())
    }

    func fetchTopRatedMovies() -> AnyPublisher<[MovieClientModel], Error> {
        baseClient
            .exec(itemsKeyPath: \MovieNetworkModel.response, requestType: .getTopRated, params: [String]())
    }

    func fetchTrendingMovies() -> AnyPublisher<[MovieClientModel], Error> {
        baseClient
            .exec(itemsKeyPath: \MovieNetworkModel.response, requestType: .getTrending, params: [String]())
    }

}

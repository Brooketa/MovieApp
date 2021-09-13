import Combine

protocol MovieClientProtocol {

    var trendingMovies: AnyPublisher<[MovieClientModel], Error> { get }

}

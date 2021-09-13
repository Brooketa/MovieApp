import Combine

protocol MovieRepositoryProtocol {

    var trendingMovies: AnyPublisher<[MovieRepositoryModel], Error> { get }

}

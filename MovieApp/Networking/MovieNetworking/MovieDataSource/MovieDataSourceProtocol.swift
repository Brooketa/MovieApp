import Combine

protocol MovieDataSourceProtocol {

    var trendingMovies: AnyPublisher<[MovieDataSourceModel], Error> { get }

}

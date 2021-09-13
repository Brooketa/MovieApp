import Combine

protocol MovieUseCaseProtocol {

    var trendingMovies: AnyPublisher<[MovieUseCaseModel], Error> { get }

}

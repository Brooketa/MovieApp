import Combine

protocol MovieUseCaseProtocol {

    func fetchPopularMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Error>

    func fetchTopRatedMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Error>

    func fetchTrendingMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Error>

}

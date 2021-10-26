import Combine

protocol MovieUseCaseProtocol {

    func fetchPopularMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Never>

    func fetchTopRatedMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Never>

    func fetchTrendingMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Never>

    func toggleFavorite(movieID: Int)

}

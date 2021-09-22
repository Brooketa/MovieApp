import Combine

protocol MovieUseCaseProtocol {

    func fetchPopularMovies(subcategory: Subcategory) -> AnyPublisher<[MovieUseCaseModel], Error>

}

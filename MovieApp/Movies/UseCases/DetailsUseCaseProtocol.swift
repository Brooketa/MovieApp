import Combine

protocol DetailsUseCaseProtocol {

    func fetchMovieDetails(movieID: Int) -> AnyPublisher<DetailsUseCaseModel, Error>

}

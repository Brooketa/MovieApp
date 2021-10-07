import Combine

protocol DetailsRepositoryProtocol {

    func fetchMovie(movieID: Int) -> AnyPublisher<DetailsMovieRepositoryModel, Error>

    func fetchCast(movieID: Int) -> AnyPublisher<[DetailsCastRepositoryModel], Error>

    func fetchReviews(movieID: Int) -> AnyPublisher<[DetailsReviewRepositoryModel], Error>

    func fetchRecommended(movieID: Int) -> AnyPublisher<[DetailsRecommendedRepositoryModel], Error>

}

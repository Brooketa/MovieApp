import Combine

protocol DetailsClientProtocol {

    func fetchMovie(movieID: Int) -> AnyPublisher<DetailsMovieResponse, Error>

    func fetchCast(movieID: Int) -> AnyPublisher<[DetailsCastResponse], Error>

    func fetchReviews(movieID: Int) -> AnyPublisher<[DetailsReviewResponse], Error>

    func fetchRecommended(movieID: Int) -> AnyPublisher<[DetailsRecommendedResponse], Error>

}

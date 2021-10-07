import Combine

protocol DetailsDataSourceProtocol {

    func fetchMovie(movieID: Int) -> AnyPublisher<DetailsMovieDataModel, Error>

    func fetchCast(movieID: Int) -> AnyPublisher<[DetailsCastDataModel], Error>

    func fetchReviews(movieID: Int) -> AnyPublisher<[DetailsReviewDataModel], Error>

    func fetchRecommended(movieID: Int) -> AnyPublisher<[DetailsRecommendedDataModel], Error>

}

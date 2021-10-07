import Combine

class DetailsDataSource: DetailsDataSourceProtocol {

    private let detailsClient: DetailsClientProtocol

    init(detailsClient: DetailsClientProtocol) {
        self.detailsClient = detailsClient
    }

    func fetchMovie(movieID: Int) -> AnyPublisher<DetailsMovieDataModel, Error> {
        detailsClient
            .fetchMovie(movieID: movieID)
            .map { DetailsMovieDataModel(from: $0) }
            .eraseToAnyPublisher()
    }

    func fetchCast(movieID: Int) -> AnyPublisher<[DetailsCastDataModel], Error> {
        detailsClient
            .fetchCast(movieID: movieID)
            .map { $0.map { DetailsCastDataModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchReviews(movieID: Int) -> AnyPublisher<[DetailsReviewDataModel], Error> {
        detailsClient
            .fetchReviews(movieID: movieID)
            .map { $0.map { DetailsReviewDataModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchRecommended(movieID: Int) -> AnyPublisher<[DetailsRecommendedDataModel], Error> {
        detailsClient
            .fetchRecommended(movieID: movieID)
            .map { $0.map { DetailsRecommendedDataModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}

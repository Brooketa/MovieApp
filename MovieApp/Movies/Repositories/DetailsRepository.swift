import Combine

class DetailsRepository: DetailsRepositoryProtocol {

    private let detailsDataSource: DetailsDataSource

    init(detailsDataSource: DetailsDataSource) {
        self.detailsDataSource = detailsDataSource
    }

    func fetchMovie(movieID: Int) -> AnyPublisher<DetailsMovieRepositoryModel, Error> {
        detailsDataSource
            .fetchMovie(movieID: movieID)
            .map { DetailsMovieRepositoryModel(from: $0) }
            .eraseToAnyPublisher()
    }

    func fetchCast(movieID: Int) -> AnyPublisher<[DetailsCastRepositoryModel], Error> {
        detailsDataSource
            .fetchCast(movieID: movieID)
            .map { $0.map { DetailsCastRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchReviews(movieID: Int) -> AnyPublisher<[DetailsReviewRepositoryModel], Error> {
        detailsDataSource
            .fetchReviews(movieID: movieID)
            .map { $0.map { DetailsReviewRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

    func fetchRecommended(movieID: Int) -> AnyPublisher<[DetailsRecommendedRepositoryModel], Error> {
        detailsDataSource
            .fetchRecommended(movieID: movieID)
            .map { $0.map { DetailsRecommendedRepositoryModel(from: $0) } }
            .eraseToAnyPublisher()
    }

}

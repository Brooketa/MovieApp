import Combine
import Foundation

class DetailsClient: DetailsClientProtocol {

    let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchMovie(movieID: Int) -> AnyPublisher<DetailsMovieResponse, Error> {
        baseClient
            .get(path: "\(APIConstants.movieEndpoint)/\(movieID)", itemsKeyPath: \DetailsMovieResponse.self)
    }

    func fetchCast(movieID: Int) -> AnyPublisher<[DetailsCastResponse], Error> {
        baseClient
            .get(
                path: "\(APIConstants.movieEndpoint)/\(movieID)\(APIConstants.creditsEndpoint)",
                itemsKeyPath: \DetailsCastNetworkResponse.cast)
    }

    func fetchReviews(movieID: Int) -> AnyPublisher<[DetailsReviewResponse], Error> {
        baseClient
            .get(
                path: "\(APIConstants.movieEndpoint)/\(movieID)\(APIConstants.reviewEndpoint)",
                itemsKeyPath: \DetailsReviewNetworkResponse.reviews)
    }

    func fetchRecommended(movieID: Int) -> AnyPublisher<[DetailsRecommendedResponse], Error> {
        baseClient
            .get(
                path: "\(APIConstants.movieEndpoint)/\(movieID)\(APIConstants.recommendedEndpoint)",
                itemsKeyPath: \DetailsRecommendedNetworkResponse.recommended)
    }

}

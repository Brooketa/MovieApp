import Combine
import Foundation

class DetailsClient: DetailsClientProtocol {

    let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchMovie(movieID: Int) -> AnyPublisher<DetailsMovieResponse, Error> {
        baseClient
            .exec(itemsKeyPath: \DetailsMovieResponse.self, requestType: .getMovie, params: ["\(movieID)"])
    }

    func fetchCast(movieID: Int) -> AnyPublisher<[DetailsCastResponse], Error> {
        baseClient
            .exec(itemsKeyPath: \DetailsCastNetworkResponse.cast, requestType: .getCast, params: ["\(movieID)"])
    }

    func fetchReviews(movieID: Int) -> AnyPublisher<[DetailsReviewResponse], Error> {
        baseClient
            .exec(itemsKeyPath: \DetailsReviewNetworkResponse.reviews, requestType: .getReview, params: ["\(movieID)"])
    }

    func fetchRecommended(movieID: Int) -> AnyPublisher<[DetailsRecommendedResponse], Error> {
        baseClient
            .exec(
                itemsKeyPath: \DetailsRecommendedNetworkResponse.recommended,
                requestType: .getRecommended,
                params: ["\(movieID)"])
    }

}

import Combine
import Foundation

class DetailsClient: DetailsClientProtocol {

    func fetchMovie(movieID: Int) -> AnyPublisher<DetailsMovieResponse, Error> {
        guard
            let url = URL(string: buildRequestPath(requestPathTemplate: APIConstants.movieURL, movieID: movieID))
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return fetchDetail(itemsKeyPath: \DetailsMovieResponse.self, url: url)
    }

    func fetchCast(movieID: Int) -> AnyPublisher<[DetailsCastResponse], Error> {
        guard
            let url = URL(string: buildRequestPath(requestPathTemplate: APIConstants.castURL, movieID: movieID))
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return fetchDetail(itemsKeyPath: \DetailsCastNetworkResponse.cast, url: url)
    }

    func fetchReviews(movieID: Int) -> AnyPublisher<[DetailsReviewResponse], Error> {
        guard
            let url = URL(string: buildRequestPath(requestPathTemplate: APIConstants.reviewURL, movieID: movieID))
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return fetchDetail(itemsKeyPath: \DetailsReviewNetworkResponse.reviews, url: url)
    }

    func fetchRecommended(movieID: Int) -> AnyPublisher<[DetailsRecommendedResponse], Error> {
        guard let url = URL(
            string: buildRequestPath(
                requestPathTemplate: APIConstants.recommendedURL,
                movieID: movieID))
        else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return fetchDetail(itemsKeyPath: \DetailsRecommendedNetworkResponse.recommended, url: url)
    }

    private func fetchDetail<ResponseType: Decodable, ResultType>(
        itemsKeyPath: KeyPath<ResponseType, ResultType>,
        url: URL
    ) -> AnyPublisher<ResultType, Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard
                    let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200
                else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: ResponseType.self, decoder: JSONDecoder())
            .map { $0[keyPath: itemsKeyPath] }
            .eraseToAnyPublisher()
    }

    private func buildRequestPath(requestPathTemplate: String, movieID: Int) -> String {
        String(format: requestPathTemplate, movieID)
    }

}

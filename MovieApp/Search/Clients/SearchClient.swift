import Combine
import Foundation

class SearchClient: SearchClientProtocol {

    let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func searchMovies(query: String) -> AnyPublisher<[SearchResponse], Error> {
        baseClient
            .get(
                path: APIConstants.searchEndpoint,
                itemsKeyPath: \SearchNetworkResponse.response,
                params: ["query": query])
    }

}

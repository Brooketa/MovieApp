import Combine

protocol BaseClientProtocol {

    func exec<ResponseType: Decodable, ResultType>(
        itemsKeyPath: KeyPath<ResponseType, ResultType>,
        requestType: RequestType,
        params: [String]
    ) -> AnyPublisher<ResultType, Error>

}

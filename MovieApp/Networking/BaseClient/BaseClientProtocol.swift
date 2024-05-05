import Combine

protocol BaseClientProtocol {

    func get<ResponseType: Decodable, ResultType>(
        path: String,
        itemsKeyPath: KeyPath<ResponseType, ResultType>,
        params: [String : String]
    ) -> AnyPublisher<ResultType, Error>

}

extension BaseClientProtocol {

    func get<ResponseType: Decodable, ResultType>(
        path: String,
        itemsKeyPath: KeyPath<ResponseType, ResultType>
    ) -> AnyPublisher<ResultType, Error> {
        get(path: path, itemsKeyPath: itemsKeyPath, params: [:])
    }

}

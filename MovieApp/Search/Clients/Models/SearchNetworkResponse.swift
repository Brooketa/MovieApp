struct SearchNetworkResponse: Decodable {

    let response: [SearchResponse]

    enum CodingKeys: String, CodingKey {
        case response = "results"
    }

}

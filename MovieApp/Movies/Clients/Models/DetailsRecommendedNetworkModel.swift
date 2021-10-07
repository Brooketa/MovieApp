struct DetailsRecommendedNetworkModel: Codable {

    let response: [DetailsRecommendedClientModel]

    enum CodingKeys: String, CodingKey {
        case response = "results"
    }

}

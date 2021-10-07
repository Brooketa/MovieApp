struct DetailsRecommendedNetworkResponse: Decodable {

    let recommended: [DetailsRecommendedResponse]

    enum CodingKeys: String, CodingKey {
        case recommended = "results"
    }

}

struct DetailsReviewNetworkModel: Codable {

    let response: [DetailsReviewClientModel]

    enum CodingKeys: String, CodingKey {
        case response = "results"
    }

}

struct DetailsReviewNetworkResponse: Decodable {

    let reviews: [DetailsReviewResponse]

    enum CodingKeys: String, CodingKey {
        case reviews = "results"
    }

}

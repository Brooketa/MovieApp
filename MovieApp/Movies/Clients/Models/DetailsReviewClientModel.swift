struct DetailsReviewClientModel: Codable {

    let author: DetailsReviewAuthorClientModel
    let reviewContent: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case author = "author_details"
        case reviewContent = "content"
        case createdAt = "created_at"
    }

}

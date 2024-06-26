struct DetailsRecommendedClientModel: Codable {

    let title: String
    let backdropImagePath: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case backdropImagePath = "backdrop_path"
    }

}

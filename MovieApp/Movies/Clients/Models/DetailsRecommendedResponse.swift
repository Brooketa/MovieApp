struct DetailsRecommendedResponse: Decodable {

    let movieID: Int
    let title: String
    let backdropImagePath: String

    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case title = "title"
        case backdropImagePath = "backdrop_path"
    }

}

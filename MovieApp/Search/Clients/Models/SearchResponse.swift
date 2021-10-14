struct SearchResponse: Decodable {

    let movieID: Int
    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String?

    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case movieTitle = "title"
        case movieDescription = "overview"
        case moviePosterImagePath = "poster_path"
    }

}

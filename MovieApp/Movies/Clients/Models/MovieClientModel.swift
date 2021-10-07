struct MovieClientModel: Codable {

    let movieID: Int
    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String
    let movieGenres: [Int]

    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case movieTitle = "title"
        case movieDescription = "overview"
        case moviePosterImagePath = "poster_path"
        case movieGenres = "genre_ids"
    }

}

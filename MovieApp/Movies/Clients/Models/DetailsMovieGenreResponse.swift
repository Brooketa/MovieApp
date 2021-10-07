struct DetailsMovieGenreResponse: Decodable {

    let genreID: Int
    let genre: String

    enum CodingKeys: String, CodingKey {
        case genreID = "id"
        case genre = "name"
    }

}

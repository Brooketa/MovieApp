struct DetailsMovieResponse: Decodable {

    let movieTitle: String
    let movieDescription: String
    let movieBackdropImagePath: String?
    let movieGenres: [DetailsMovieGenreResponse]
    let rating: Double
    let duration: Int
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case movieTitle = "title"
        case movieDescription = "overview"
        case movieBackdropImagePath = "backdrop_path"
        case movieGenres = "genres"
        case rating = "vote_average"
        case duration = "runtime"
        case releaseDate = "release_date"
    }

}

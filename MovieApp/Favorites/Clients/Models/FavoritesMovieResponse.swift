struct FavoritesMovieResponse: Decodable {

    let movieID: Int
    let moviePosterImagePath: String

    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case moviePosterImagePath = "poster_path"
    }

}

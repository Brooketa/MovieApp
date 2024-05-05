struct DetailsMovieDataModel {

    let movieTitle: String
    let movieDescription: String
    let movieBackdropImagePath: String
    let movieGenres: [DetailsMovieGenreDataModel]
    let rating: Double
    let duration: Int
    let releaseDate: String

    init(from model: DetailsMovieResponse) {
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        movieBackdropImagePath = APIConstants.imageBaseURL + (model.movieBackdropImagePath ?? "")
        movieGenres = model.movieGenres.map { DetailsMovieGenreDataModel(from: $0) }
        rating = model.rating
        duration = model.duration
        releaseDate = model.releaseDate
    }

}

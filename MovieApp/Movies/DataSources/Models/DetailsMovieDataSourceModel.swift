struct DetailsMovieDataSourceModel {

    let movieTitle: String
    let movieDescription: String
    let movieBackdropImagePath: String
    let movieGenres: [DetailsMovieGenreDataSourceModel]
    let rating: Double
    let duration: Int
    let releaseDate: String

    init(from model: DetailsMovieClientModel) {
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        movieBackdropImagePath = APIConstants.posterImageRootURL + model.movieBackdropImagePath
        movieGenres = model.movieGenres.map { DetailsMovieGenreDataSourceModel(from: $0) }
        rating = model.rating
        duration = model.duration
        releaseDate = model.releaseDate
    }

}

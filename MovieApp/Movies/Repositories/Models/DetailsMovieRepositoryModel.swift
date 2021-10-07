struct DetailsMovieRepositoryModel {

    let movieTitle: String
    let movieDescription: String
    let movieBackdropImagePath: String
    let movieGenres: [DetailsMovieGenreRepositoryModel]
    let rating: Double
    let duration: Int
    let releaseDate: String

    init(from model: DetailsMovieDataModel) {
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        movieBackdropImagePath = model.movieBackdropImagePath
        movieGenres = model.movieGenres.map { DetailsMovieGenreRepositoryModel(from: $0) }
        rating = model.rating
        duration = model.duration
        releaseDate = model.releaseDate
    }

}

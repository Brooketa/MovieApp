struct MovieDataSourceModel {

    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String

    init(from model: MovieClientModel) {
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImagePath = APIConstants.posterImageRootURL + model.moviePosterImagePath
    }

}

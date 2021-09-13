struct MovieRepositoryModel {

    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String

    init(from model: MovieDataSourceModel) {
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImagePath = model.moviePosterImagePath
    }

}

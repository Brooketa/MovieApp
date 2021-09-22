struct MovieRepositoryModel {

    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String
    let movieGenres: [Int]

    init(from model: MovieDataSourceModel) {
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImagePath = model.moviePosterImagePath
        movieGenres = model.movieGenres
    }

}

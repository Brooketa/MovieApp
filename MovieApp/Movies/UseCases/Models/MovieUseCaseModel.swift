struct MovieUseCaseModel {

    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String
    let movieGenres: [Int]

    init(from model: MovieRepositoryModel) {
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImagePath = model.moviePosterImagePath
        movieGenres = model.movieGenres
    }

}

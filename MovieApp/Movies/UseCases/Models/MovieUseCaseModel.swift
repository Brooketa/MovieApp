struct MovieUseCaseModel {

    let movieID: Int
    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String
    let movieGenres: [Int]

    init(from model: MovieRepositoryModel) {
        movieID = model.movieID
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImagePath = model.moviePosterImagePath
        movieGenres = model.movieGenres
    }

}

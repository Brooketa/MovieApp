struct SearchRepositoryModel {

    let movieID: Int
    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String

    init(from model: SearchDataModel) {
        movieID = model.movieID
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImagePath = model.moviePosterImagePath
    }

}

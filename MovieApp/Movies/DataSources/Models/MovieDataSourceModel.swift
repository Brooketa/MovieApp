struct MovieDataSourceModel {

    let movieID: Int
    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String
    let movieGenres: [Int]

    init(from model: MovieClientModel) {
        movieID = model.movieID
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImagePath = APIConstants.imageBaseURL + model.moviePosterImagePath
        movieGenres = model.movieGenres
    }

}

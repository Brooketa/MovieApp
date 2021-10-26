struct MovieRepositoryModel {

    let movieID: Int
    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String
    let movieGenres: [Int]
    let isFavorite: Bool

    init(from model: MovieDataSourceModel, isFavorite: Bool) {
        movieID = model.movieID
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImagePath = model.moviePosterImagePath
        movieGenres = model.movieGenres
        self.isFavorite = isFavorite
    }

}

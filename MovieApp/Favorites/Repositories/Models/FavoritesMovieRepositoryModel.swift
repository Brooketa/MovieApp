struct FavoritesMovieRepositoryModel {

    let movieID: Int
    let moviePosterImagePath: String

    init(from model: FavoritesMovieDataModel) {
        movieID = model.movieID
        moviePosterImagePath = model.moviePosterImagePath
    }

}

struct FavoritesMovieDataModel {

    let movieID: Int
    let moviePosterImagePath: String

    init(from model: FavoritesMovieResponse) {
        movieID = model.movieID
        moviePosterImagePath = APIConstants.posterImageRootURL + model.moviePosterImagePath
    }

}

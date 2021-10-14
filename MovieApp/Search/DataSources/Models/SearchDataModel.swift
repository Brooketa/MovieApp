struct SearchDataModel {

    let movieID: Int
    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String

    init(from model: SearchResponse) {
        movieID = model.movieID
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImagePath = APIConstants.posterImageRootURL + (model.moviePosterImagePath ?? "")
    }

}

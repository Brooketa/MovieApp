import Foundation

struct FavoritesMovieUseCaseModel {

    let movieID: Int
    let moviePosterImageURL: URL?

    init(from model: FavoritesMovieRepositoryModel) {
        movieID = model.movieID
        moviePosterImageURL = URL(string: model.moviePosterImagePath)
    }

}

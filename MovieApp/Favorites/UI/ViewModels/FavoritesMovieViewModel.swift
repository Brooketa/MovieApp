import Foundation

struct FavoritesMovieViewModel: Hashable {

    let movieID: Int
    let moviePosterImageURL: URL?
    let isFavorite: Bool

    init(from model: FavoritesMovieUseCaseModel) {
        movieID = model.movieID
        moviePosterImageURL = model.moviePosterImageURL
        isFavorite = true
    }

}

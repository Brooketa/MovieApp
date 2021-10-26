import Foundation

struct FavoritesMovieViewModel: Hashable {

    let uuid: UUID
    let movieID: Int
    let moviePosterImageURL: URL?
    let isFavorite: Bool

    init(from model: FavoritesMovieUseCaseModel) {
        uuid = UUID()
        movieID = model.movieID
        moviePosterImageURL = model.moviePosterImageURL
        isFavorite = true
    }

}

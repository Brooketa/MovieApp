import UIKit

struct SearchMovieViewModel: Hashable {

    let uuid: UUID
    let movieID: Int
    let movieTitle: String
    let movieDescription: String
    let moviePosterImageURL: URL?

    init(with model: SearchUseCaseModel) {
        uuid = UUID()
        movieID = model.movieID
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImageURL = model.moviePosterImageURL
    }

}

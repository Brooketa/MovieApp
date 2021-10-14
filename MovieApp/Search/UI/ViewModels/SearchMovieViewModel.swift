import UIKit

struct SearchMovieViewModel: Hashable {

    let uuid: UUID
    let movieTitle: String
    let movieDescription: String
    let moviePosterImageURL: URL?

    init(with model: SearchUseCaseModel) {
        uuid = UUID()
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImageURL = model.moviePosterImageURL
    }

}

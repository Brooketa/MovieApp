import UIKit

struct MovieViewModel: Hashable {

    let uuid: UUID
    let movieTitle: String
    let movieDescription: String
    let moviePosterImageURL: URL?
    let movieGenres: [Int]

    init(with model: MovieUseCaseModel) {
        uuid = UUID()
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImageURL = URL(string: model.moviePosterImagePath)
        movieGenres = model.movieGenres
    }

}

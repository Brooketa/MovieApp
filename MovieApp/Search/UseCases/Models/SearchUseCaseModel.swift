import Foundation

struct SearchUseCaseModel {

    let movieID: Int
    let movieTitle: String
    let movieDescription: String
    let moviePosterImageURL: URL?

    init(from model: SearchRepositoryModel) {
        movieID = model.movieID
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImageURL = URL(string: model.moviePosterImagePath)
    }

}

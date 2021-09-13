import Foundation

struct MovieUseCaseModel {

    let movieTitle: String
    let movieDescription: String
    let moviePosterImagePath: String

    init(from model: MovieRepositoryModel) {
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImagePath = model.moviePosterImagePath
    }

}

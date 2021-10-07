import Foundation

struct DetailsMovieUseCaseModel {

    let movieTitle: String
    let movieDescription: String
    let movieBackdropImageURL: URL?
    let movieGenres: [DetailsMovieGenreUseCaseModel]
    let rating: Double
    let duration: Int
    let releaseDate: String

    init(from model: DetailsMovieRepositoryModel) {
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        movieBackdropImageURL = URL(string: model.movieBackdropImagePath)
        movieGenres = model.movieGenres.map { DetailsMovieGenreUseCaseModel(from: $0) }
        rating = model.rating
        duration = model.duration
        releaseDate = model.releaseDate
    }

}

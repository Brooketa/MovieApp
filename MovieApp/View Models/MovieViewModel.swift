import UIKit

struct MovieViewModel: Codable, Hashable {

    let movieTitle: String
    let movieDescription: String
    let moviePosterImageURL: URL?
    let movieGenres: [Int]

    init(with model: MovieUseCaseModel) {
        movieTitle = model.movieTitle
        movieDescription = model.movieDescription
        moviePosterImageURL = URL(string: model.moviePosterImagePath)
        movieGenres = model.movieGenres
    }

    enum CodingKeys: String, CodingKey {
        case movieTitle = "title"
        case movieDescription = "overview"
        case moviePosterImageURL = "poster_path"
        case movieGenres = "genre_ids"
    }

}

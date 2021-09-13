import UIKit

struct MovieViewModel: Codable {

    let movieTitle: String
    let movieDescription: String
    let moviePosterImageURL: URL?

    init(with movieUseCaseModel: MovieUseCaseModel) {
        self.movieTitle = movieUseCaseModel.movieTitle
        self.movieDescription = movieUseCaseModel.movieDescription
        self.moviePosterImageURL = URL(string: movieUseCaseModel.moviePosterImagePath)
    }

    enum CodingKeys: String, CodingKey {
        case movieTitle = "title"
        case movieDescription = "overview"
        case moviePosterImageURL = "poster_path"
    }

}

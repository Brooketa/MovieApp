import UIKit

struct MovieViewModel: Codable {

    let movieTitle: String
    let movieDescription: String
    let movieImageURL: URL?

    init(movieTitle: String, movieDescription: String, movieImageURL: URL? = nil) {
        self.movieTitle = movieTitle
        self.movieDescription = movieDescription
        self.movieImageURL = movieImageURL
    }

    enum CodingKeys: String, CodingKey {
        case movieTitle = "title"
        case movieDescription = "overview"
        case movieImageURL = "poster_path"
    }

}

import UIKit

struct MovieViewModel {

    let movieTitle: String
    let movieDescription: String
    let movieImageURL: URL?

    init(movieTitle: String, movieDescription: String, movieImageURL: URL? = nil) {
        self.movieTitle = movieTitle
        self.movieDescription = movieDescription
        self.movieImageURL = movieImageURL
    }

}

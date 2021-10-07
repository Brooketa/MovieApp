import Foundation

struct DetailsHeaderViewModel {

    let movieTitle: String
    let movieBackdropImageURL: URL?
    let movieGenres: [MovieGenreViewModel]
    let rating: Double
    let duration: Int
    let releaseDate: String
    let releaseYear: Int

}

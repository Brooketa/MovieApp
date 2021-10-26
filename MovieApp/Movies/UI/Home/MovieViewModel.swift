import UIKit

struct MovieViewModel: Codable, Hashable {

    let uuid: UUID
    let movieID: Int
    let moviePosterImageURL: URL?
    let isFavorite: Bool

    init(with model: MovieUseCaseModel) {
        uuid = UUID()
        movieID = model.movieID
        moviePosterImageURL = URL(string: model.moviePosterImagePath)
        isFavorite = model.isFavorite
    }

}

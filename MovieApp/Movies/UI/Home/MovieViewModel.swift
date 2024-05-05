import UIKit

struct MovieViewModel: Codable, Hashable {

    static var emptyModel: MovieViewModel {
        MovieViewModel(uuid: UUID(), movieID: nil, moviePosterImageURL: nil, isFavorite: false)
    }

    let uuid: UUID
    let movieID: Int?
    let moviePosterImageURL: URL?
    let isFavorite: Bool

    init(uuid: UUID, movieID: Int?, moviePosterImageURL: URL?, isFavorite: Bool) {
        self.uuid = uuid
        self.movieID = movieID
        self.moviePosterImageURL = moviePosterImageURL
        self.isFavorite = isFavorite
    }

    init(with model: MovieUseCaseModel) {
        uuid = UUID()
        movieID = model.movieID
        moviePosterImageURL = URL(string: model.moviePosterImagePath)
        isFavorite = model.isFavorite
    }

}

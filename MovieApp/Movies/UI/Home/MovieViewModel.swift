import UIKit

struct MovieViewModel: Codable, Hashable {

    static var emptyModel: MovieViewModel {
        MovieViewModel(
            uuid: UUID(),
            movieID: MovieCollectionViewCellConstants.faultyMovieID,
            moviePosterImageURL: nil,
            isFavorite: false)
    }

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

    init(uuid: UUID, movieID: Int, moviePosterImageURL: URL?, isFavorite: Bool) {
        self.uuid = uuid
        self.movieID = movieID
        self.moviePosterImageURL = moviePosterImageURL
        self.isFavorite = isFavorite
    }

}

import Foundation

struct RecommendedMovieViewModel: Hashable {

    let uuid: UUID
    let movieID: Int
    let title: String
    let backdropImageURL: URL?

    init(from model: DetailsRecommendedUseCaseModel) {
        uuid = UUID()
        movieID = model.movieID
        title = model.title
        backdropImageURL = model.backdropImageURL
    }

}

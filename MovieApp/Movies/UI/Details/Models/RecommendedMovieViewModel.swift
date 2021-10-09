import Foundation

struct RecommendedMovieViewModel: Hashable {

    let uuid: UUID
    let title: String
    let backdropImageURL: URL?

    init(from model: DetailsRecommendedUseCaseModel) {
        uuid = UUID()
        title = model.title
        backdropImageURL = model.backdropImageURL
    }

}

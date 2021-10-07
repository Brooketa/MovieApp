import Foundation

struct RecommendedMovieModel {

    let title: String
    let backdropImageURL: URL?

    init(from model: DetailsRecommendedUseCaseModel) {
        title = model.title
        backdropImageURL = model.backdropImageURL
    }

}

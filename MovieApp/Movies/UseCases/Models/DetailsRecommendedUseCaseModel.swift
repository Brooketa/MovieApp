import Foundation

struct DetailsRecommendedUseCaseModel {

    let title: String
    let backdropImageURL: URL?

    init(from model: DetailsRecommendedRepositoryModel) {
        title = model.title
        backdropImageURL = URL(string: model.backdropImagePath)
    }

}

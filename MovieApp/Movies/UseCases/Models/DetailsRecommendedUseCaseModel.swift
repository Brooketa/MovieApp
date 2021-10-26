import Foundation

struct DetailsRecommendedUseCaseModel {

    let movieID: Int
    let title: String
    let backdropImageURL: URL?

    init(from model: DetailsRecommendedRepositoryModel) {
        movieID = model.movieID
        title = model.title
        backdropImageURL = URL(string: model.backdropImagePath)
    }

}

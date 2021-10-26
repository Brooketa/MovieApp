struct DetailsRecommendedRepositoryModel {

    let movieID: Int
    let title: String
    let backdropImagePath: String

    init(from model: DetailsRecommendedDataModel) {
        movieID = model.movieID
        title = model.title
        backdropImagePath = model.backdropImagePath
    }

}

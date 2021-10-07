struct DetailsRecommendedRepositoryModel {

    let title: String
    let backdropImagePath: String

    init(from model: DetailsRecommendedDataModel) {
        title = model.title
        backdropImagePath = model.backdropImagePath
    }

}

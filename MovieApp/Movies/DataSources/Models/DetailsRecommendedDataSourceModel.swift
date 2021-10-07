struct DetailsRecommendedDataSourceModel {

    let title: String
    let backdropImagePath: String

    init(from model: DetailsRecommendedClientModel) {
        title = model.title
        backdropImagePath = APIConstants.posterImageRootURL + model.backdropImagePath
    }

}

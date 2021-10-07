struct DetailsRecommendedDataModel {

    let title: String
    let backdropImagePath: String

    init(from model: DetailsRecommendedResponse) {
        title = model.title
        backdropImagePath = APIConstants.posterImageRootURL + model.backdropImagePath
    }

}

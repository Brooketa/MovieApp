struct DetailsRecommendedDataModel {

    let movieID: Int
    let title: String
    let backdropImagePath: String

    init(from model: DetailsRecommendedResponse) {
        movieID = model.movieID
        title = model.title
        backdropImagePath = APIConstants.imageBaseURL + model.backdropImagePath
    }

}

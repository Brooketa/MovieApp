struct DetailsReviewDataSourceModel {

    let author: DetailsReviewAuthorDataSourceModel
    let reviewContent: String
    let createdAt: String

    init(from model: DetailsReviewClientModel) {
        author = DetailsReviewAuthorDataSourceModel(from: model.author)
        reviewContent = model.reviewContent
        createdAt = model.createdAt
    }

}

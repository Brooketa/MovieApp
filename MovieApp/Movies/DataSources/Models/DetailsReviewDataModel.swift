struct DetailsReviewDataModel {

    let author: DetailsReviewAuthorDataModel
    let reviewContent: String
    let createdAt: String

    init(from model: DetailsReviewResponse) {
        author = DetailsReviewAuthorDataModel(from: model.author)
        reviewContent = model.reviewContent
        createdAt = model.createdAt
    }

}

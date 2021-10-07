struct DetailsReviewRepositoryModel {

    let author: DetailsReviewAuthorRepositoryModel
    let reviewContent: String
    let createdAt: String

    init(from model: DetailsReviewDataModel) {
        author = DetailsReviewAuthorRepositoryModel(from: model.author)
        reviewContent = model.reviewContent
        createdAt = model.createdAt
    }

}

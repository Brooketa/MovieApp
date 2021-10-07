struct DetailsReviewUseCaseModel {

    let author: DetailsReviewAuthorUseCaseModel
    let reviewContent: String
    let createdAt: String

    init(from model: DetailsReviewRepositoryModel) {
        author = DetailsReviewAuthorUseCaseModel(from: model.author)
        reviewContent = model.reviewContent
        createdAt = model.createdAt
    }

}

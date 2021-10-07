struct ReviewModel {

    let author: ReviewAuthorModel
    let reviewContent: String
    let createdAt: String

    init(from model: DetailsReviewUseCaseModel) {
        author = ReviewAuthorModel(from: model.author)
        reviewContent = model.reviewContent
        createdAt = model.createdAt
    }

}

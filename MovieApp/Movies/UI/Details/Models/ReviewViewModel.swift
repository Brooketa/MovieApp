struct ReviewViewModel {

    let author: ReviewAuthorViewModel
    let reviewContent: String
    let createdAt: String

    init(from model: DetailsReviewUseCaseModel) {
        author = ReviewAuthorViewModel(from: model.author)
        reviewContent = model.reviewContent
        createdAt = model.createdAt
    }

}

struct DetailsReviewViewModel {

    let reviews: [ReviewViewModel]

    init(from models: [DetailsReviewUseCaseModel]) {
        reviews = models.map { ReviewViewModel(from: $0) }
    }

}

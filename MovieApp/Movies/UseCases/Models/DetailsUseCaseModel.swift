struct DetailsUseCaseModel {

    let movieDetails: DetailsMovieUseCaseModel
    let castDetails: [DetailsCastUseCaseModel]
    let reviewDetails: [DetailsReviewUseCaseModel]
    let recommendedDetails: [DetailsRecommendedUseCaseModel]

    init(
        movieModel: DetailsMovieUseCaseModel,
        castModels: [DetailsCastUseCaseModel],
        reviewModels: [DetailsReviewUseCaseModel],
        recommendedModels: [DetailsRecommendedUseCaseModel]
    ) {
        movieDetails = movieModel
        castDetails = castModels
        reviewDetails = reviewModels
        recommendedDetails = recommendedModels
    }

}

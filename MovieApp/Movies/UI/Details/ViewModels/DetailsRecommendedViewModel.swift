struct DetailsRecommendedViewModel {

    let recommendedMovies: [RecommendedMovieViewModel]

    init(from models: [DetailsRecommendedUseCaseModel]) {
        recommendedMovies = models.map { RecommendedMovieViewModel(from: $0) }
    }

}

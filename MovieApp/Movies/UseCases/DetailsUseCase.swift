import Combine

class DetailsUseCase: DetailsUseCaseProtocol {

    private let detailsRepository: DetailsRepositoryProtocol

    init(detailsRepository: DetailsRepositoryProtocol) {
        self.detailsRepository = detailsRepository
    }

    func fetchMovieDetails(movieID: Int) -> AnyPublisher<DetailsUseCaseModel, Error> {
        Publishers.CombineLatest4(
            detailsRepository.fetchMovie(movieID: movieID),
            detailsRepository.fetchCast(movieID: movieID),
            detailsRepository.fetchReviews(movieID: movieID),
            detailsRepository.fetchRecommended(movieID: movieID))
            .map { movie, cast, review, recommended in
                return DetailsUseCaseModel(
                    movieModel: DetailsMovieUseCaseModel(from: movie),
                    castModels: cast.map { DetailsCastUseCaseModel(from: $0) },
                    reviewModels: review.map { DetailsReviewUseCaseModel(from: $0) },
                    recommendedModels: recommended.map { DetailsRecommendedUseCaseModel(from: $0) })
            }
            .eraseToAnyPublisher()
    }

}

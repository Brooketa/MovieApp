import Combine
import UIKit

class DetailsPresenter: NSObject {

    private let detailsUseCase: DetailsUseCaseProtocol

    let dateFormatter = DateFormatter()

    init(detailsUseCase: DetailsUseCaseProtocol) {
        self.detailsUseCase = detailsUseCase
    }

    func movieDetails(movieID: Int) -> AnyPublisher<DetailsViewModel, Error> {
        detailsUseCase
            .fetchMovieDetails(movieID: movieID)
            .compactMap { [weak self] model in
                guard let self = self else { return nil }

                return DetailsViewModel(
                    headerViewModel: self.getHeaderViewModel(from: model.movieDetails),
                    overviewViewModel: self.getOverviewViewModel(
                        movieModel: model.movieDetails,
                        castModels: model.castDetails),
                    topCastViewModel: DetailsTopCastViewModel(from: model.castDetails),
                    reviewViewModel: self.getReviewViewModel(from: model.reviewDetails),
                    recommendedViewModel: DetailsRecommendedViewModel(from: model.recommendedDetails))
            }
            .eraseToAnyPublisher()
    }

    private func getHeaderViewModel(from model: DetailsMovieUseCaseModel) -> DetailsHeaderViewModel {
        let movieTitle = model.movieTitle
        let movieBackdropImageURL = model.movieBackdropImageURL
        let movieGenres = model.movieGenres.map { MovieGenreViewModel(from: $0) }
        let rating = model.rating
        let duration = model.duration

        dateFormatter.dateFormat = "yyyy-MM-dd"

        var releaseDate = ""
        var releaseYear = 0

        if let date = dateFormatter.date(from: model.releaseDate) {
            dateFormatter.dateFormat = "dd/MM/yyyy"
            releaseDate = dateFormatter.string(from: date)

            let calendar = Calendar.current
            let components = calendar.dateComponents([.year], from: date)
            releaseYear = components.year ?? 0
        }

        return DetailsHeaderViewModel(
            movieTitle: movieTitle,
            movieBackdropImageURL: movieBackdropImageURL,
            movieGenres: movieGenres,
            rating: rating,
            duration: duration,
            releaseDate: releaseDate,
            releaseYear: releaseYear)
    }

    private func getOverviewViewModel(
        movieModel: DetailsMovieUseCaseModel,
        castModels: [DetailsCastUseCaseModel]
    ) -> DetailsOverviewViewModel {
        let overview = movieModel.movieDescription
        let firstSixCasts = castModels.prefix(6).map { OverviewCastViewModel(from: $0) }
        let firstRowCast = Array(firstSixCasts.prefix(3))
        let secondRowCast = Array(firstSixCasts.suffix(3))

        return DetailsOverviewViewModel(
            overview: overview,
            firstRowCast: firstRowCast,
            secondRowCast: secondRowCast)
    }

    private func getReviewViewModel(from models: [DetailsReviewUseCaseModel]) -> DetailsReviewViewModel {
        DetailsReviewViewModel(
            reviews: models.map {
                ReviewViewModel(
                    author: ReviewAuthorViewModel(from: $0.author),
                    reviewContent: $0.reviewContent,
                    createdAt: getReviewDate(createdAt: $0.createdAt))
            })
    }

    private func getReviewDate(createdAt: String) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        guard let date = dateFormatter.date(from: createdAt) else {
            return ""
        }

        dateFormatter.dateStyle = .long

        return dateFormatter.string(from: date)
    }

}

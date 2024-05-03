import Combine
import UIKit
import SnapKit

class DetailsViewController: UIViewController {

    var scrollView: UIScrollView!
    var contentView: UIView!
    var stackView: UIStackView!

    var headerView: DetailsHeaderView!
    var overviewView: DetailsOverviewView!
    var topBilledCastView: DetailsTopBilledCastView!
    var reviewView: DetailsReviewView!
    var recommendedView: DetailsRecommendedView!

    private var detailsPresenter: DetailsPresenter!

    private var cancellables = Set<AnyCancellable>()

    init(presenter: DetailsPresenter) {
        detailsPresenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        configureRecommendedMovieSubscription()

        tabBarController?.tabBar.barTintColor = .primaryBackground
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        headerView.configureGradient()
    }

    public func set(movieID: Int) {
        detailsPresenter
            .movieDetails(movieID: movieID)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] viewModel in
                guard let self = self else { return }

                self.headerView.setHeader(from: viewModel.headerViewModel)
                self.overviewView.setOverview(from: viewModel.overviewViewModel)
                self.topBilledCastView.setCast(from: viewModel.topCastViewModel)
                self.reviewView.setReview(from: viewModel.reviewViewModel)
                self.recommendedView.setRecommended(from: viewModel.recommendedViewModel)
            })
            .store(in: &cancellables)
    }

    private func configureRecommendedMovieSubscription() {
        recommendedView
            .recommendedMovieTap
            .sink(receiveValue: { [weak self] movieID in
                guard let self = self else { return }

                self.detailsPresenter.showRecommendedMovieDetails(movieID: movieID)
            })
            .store(in: &cancellables)
    }

}

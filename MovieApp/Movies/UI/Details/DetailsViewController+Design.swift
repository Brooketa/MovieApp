import UIKit
import SnapKit

extension DetailsViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)

        contentView = UIView()
        scrollView.addSubview(contentView)

        stackView = UIStackView()
        contentView.addSubview(stackView)

        headerView = DetailsHeaderView()
        stackView.addArrangedSubview(headerView)

        overviewView = DetailsOverviewView()
        stackView.addArrangedSubview(overviewView)

        topBilledCastView = DetailsTopBilledCastView()
        stackView.addArrangedSubview(topBilledCastView)

        reviewView = DetailsReviewView()
        stackView.addArrangedSubview(reviewView)

        recommendedView = DetailsRecommendedView()
        stackView.addArrangedSubview(recommendedView)
    }

    func styleViews() {
        setDefaultNavBar()
        view.backgroundColor = .white

        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.isDirectionalLockEnabled = true

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
    }

    func defineLayoutForViews() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        topBilledCastView.snp.makeConstraints { make in
            make.height.equalTo(self.view.snp.width).multipliedBy(0.8)
        }

        recommendedView.snp.makeConstraints { make in
            make.height.equalTo(self.view.snp.width).multipliedBy(0.6)
        }
    }

}

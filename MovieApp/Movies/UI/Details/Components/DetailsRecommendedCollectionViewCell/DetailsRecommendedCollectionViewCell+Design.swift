import UIKit
import SnapKit

extension DetailsRecommendedCollectionViewCell: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        backdropImageView = UIImageView()
        contentView.addSubview(backdropImageView)

        movieTitleLabel = UILabel()
        contentView.addSubview(movieTitleLabel)
    }

    func styleViews() {
        backdropImageView.contentMode = .scaleAspectFill
        backdropImageView.configureRoundedCorners()

        movieTitleLabel.textColor = .darkBlue
        movieTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }

    func defineLayoutForViews() {
        backdropImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.lessThanOrEqualTo(self.snp.height).multipliedBy(0.65)
        }

        movieTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(backdropImageView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

}

import UIKit
import SnapKit

extension SearchCollectionViewCell: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        movieImageView = UIImageView()
        contentView.addSubview(movieImageView)

        movieTitleLabel = UILabel()
        contentView.addSubview(movieTitleLabel)

        movieDescriptionLabel = UILabel()
        contentView.addSubview(movieDescriptionLabel)
    }

    func styleViews() {
        addShadow()

        contentView.backgroundColor = .cellBackgroundColor
        contentView.configureRoundedCorners()

        movieTitleLabel.font = .heading3Bold
        movieTitleLabel.textColor = .cellTitle
        movieTitleLabel.numberOfLines = 0

        movieDescriptionLabel.font = .textRegular
        movieDescriptionLabel.textColor = .grayText
        movieDescriptionLabel.numberOfLines = 0
    }

    func defineLayoutForViews() {
        movieImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(100)
        }

        movieTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.leading.equalTo(movieImageView.snp.trailing).offset(15)
        }

        movieDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp.bottom)
            make.leading.equalTo(movieImageView.snp.trailing).offset(15)
            make.right.equalToSuperview().inset(15)
            make.bottom.lessThanOrEqualToSuperview().inset(15)
        }
    }

}

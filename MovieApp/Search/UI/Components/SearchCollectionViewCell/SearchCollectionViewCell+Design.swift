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
        contentView.backgroundColor = .cellBackgroundColor

        movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        movieTitleLabel.textColor = .cellTitle

        movieDescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        movieDescriptionLabel.textColor = .grayText
        movieDescriptionLabel.numberOfLines = 0

        addShadow()
        contentView.configureRoundedCorners()
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
            make.height.equalTo(20)
        }

        movieDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp.bottom)
            make.leading.equalTo(movieImageView.snp.trailing).offset(15)
            make.right.bottom.equalToSuperview().inset(15)
        }
    }

}

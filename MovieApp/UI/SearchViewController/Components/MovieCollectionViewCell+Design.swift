import UIKit
import SnapKit

extension MovieCollectionViewCell: ConstructViewsProtocol {

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
        contentView.backgroundColor = .white

        movieTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)

        movieDescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        movieDescriptionLabel.textColor = .systemGray
        movieDescriptionLabel.numberOfLines = 0

        addShadow()
        configureRoundedCorners()
    }

    func defineLayoutForViews() {
        movieImageView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(100)
        }

        movieTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-20)
            make.left.equalTo(movieImageView.snp.right).offset(15)
            make.height.equalTo(20)
        }

        movieDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp.bottom)
            make.left.equalTo(movieImageView.snp.right).offset(15)
            make.right.bottom.equalToSuperview().offset(-20)
        }
    }

}

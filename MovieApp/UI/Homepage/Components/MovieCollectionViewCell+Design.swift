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

        configureShadow()
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

    private func configureShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.1
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: contentView.layer.cornerRadius - 5).cgPath
    }

    private func configureRoundedCorners() {
        contentView.layer.cornerRadius = 10.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
    }

}

import UIKit
import SnapKit

extension DetailsCastCollectionViewCell: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        castImageView = UIImageView()
        contentView.addSubview(castImageView)

        castNameLabel = UILabel()
        contentView.addSubview(castNameLabel)

        castRoleLabel = UILabel()
        contentView.addSubview(castRoleLabel)
    }

    func styleViews() {
        addShadow()
        contentView.configureRoundedCorners()

        contentView.backgroundColor = .cellBackgroundColor

        castNameLabel.textColor = .secondaryTitle
        castNameLabel.font = .systemFont(ofSize: 14, weight: .bold)
        castNameLabel.numberOfLines = 0

        castRoleLabel.textColor = .grayText
        castRoleLabel.font = .systemFont(ofSize: 11)
        castRoleLabel.numberOfLines = 0
    }

    func defineLayoutForViews() {
        castImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.lessThanOrEqualTo(self.snp.height).multipliedBy(0.65)
        }

        castNameLabel.snp.makeConstraints { make in
            make.top.equalTo(castImageView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(10)
        }

        castRoleLabel.snp.makeConstraints { make in
            make.top.equalTo(castNameLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }

}

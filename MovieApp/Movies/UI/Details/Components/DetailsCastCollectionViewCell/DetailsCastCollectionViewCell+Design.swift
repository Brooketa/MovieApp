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

        castImageView.contentMode = .scaleAspectFill
        castImageView.clipsToBounds = true

        castNameLabel.textColor = .secondaryTitle
        castNameLabel.font = .textBold
        castNameLabel.numberOfLines = 0

        castRoleLabel.textColor = .grayText
        castRoleLabel.font = .textSmall
        castRoleLabel.numberOfLines = 0
    }

    func defineLayoutForViews() {
        castImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.lessThanOrEqualTo(self.snp.height).multipliedBy(0.65)
        }

        castNameLabel.snp.makeConstraints { make in
            make.top.equalTo(castImageView.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(10)
        }

        castRoleLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(castNameLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }

}

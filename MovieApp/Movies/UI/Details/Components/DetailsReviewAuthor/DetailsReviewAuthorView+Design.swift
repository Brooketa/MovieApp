import UIKit
import SnapKit

extension DetailsReviewAuthorView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        authorAvatarImageView = UIImageView()
        addSubview(authorAvatarImageView)

        stackView = UIStackView()
        addSubview(stackView)

        titleLabel = UILabel()
        stackView.addArrangedSubview(titleLabel)

        writtenByLabel = UILabel()
        stackView.addArrangedSubview(writtenByLabel)
    }

    func styleViews() {
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10

        titleLabel.textColor = .secondaryTitle
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 0

        writtenByLabel.textColor = .grayText
        writtenByLabel.font = .systemFont(ofSize: 14)
        writtenByLabel.numberOfLines = 0
    }

    func defineLayoutForViews() {
        authorAvatarImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.size.equalTo(self.snp.height).multipliedBy(0.8)
            make.centerY.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.leading.equalTo(authorAvatarImageView.snp.trailing).offset(16)
            make.top.trailing.bottom.equalToSuperview()
        }
    }

}

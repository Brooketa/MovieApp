import UIKit
import SnapKit

extension SignificantCrewView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        nameLabel = UILabel()
        addSubview(nameLabel)

        roleLabel = UILabel()
        addSubview(roleLabel)
    }

    func styleViews() {
        nameLabel.textColor = .secondaryTitle
        nameLabel.font = .textHeavy
        nameLabel.numberOfLines = 0

        roleLabel.textColor = .text
        roleLabel.font = .textRegular
    }

    func defineLayoutForViews() {
        nameLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }

        roleLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(nameLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(17)
        }
    }

}

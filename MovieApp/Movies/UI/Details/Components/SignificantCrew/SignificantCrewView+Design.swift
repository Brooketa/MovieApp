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
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)

        roleLabel.textColor = .black
        roleLabel.font = UIFont.systemFont(ofSize: 16)
    }

    func defineLayoutForViews() {
        nameLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalTo(roleLabel.snp.top).inset(-5)
        }

        roleLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

}

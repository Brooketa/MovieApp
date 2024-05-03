import UIKit
import SnapKit

extension DetailsOverviewView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        overviewLabel = UILabel()
        addSubview(overviewLabel)

        descriptionLabel = UILabel()
        addSubview(descriptionLabel)

        stackView = UIStackView()
        addSubview(stackView)
    }

    func styleViews() {
        backgroundColor = .primaryBackground

        overviewLabel.text = LocalizableString.detailsOverviewTitle.localized
        overviewLabel.textColor = .primaryTitle
        overviewLabel.font = .heading1

        descriptionLabel.textColor = .text
        descriptionLabel.font = .textRegular
        descriptionLabel.numberOfLines = 0

        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 30
    }

    func defineLayoutForViews() {
        overviewLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(overviewLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(15)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(20)
        }
    }

}

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
        overviewLabel.text = "Overview"
        overviewLabel.textColor = .darkBlue
        overviewLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)

        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0

        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
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

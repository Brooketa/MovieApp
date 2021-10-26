import UIKit
import SnapKit

extension HomeSectionHeader: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        stackView = UIStackView()
        addSubview(stackView)

        sectionTitleLabel = UILabel()
        stackView.addArrangedSubview(sectionTitleLabel)

        subcategoryScrollView = SubcategoryScrollView()
        stackView.addArrangedSubview(subcategoryScrollView)
    }

    func styleViews() {
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.axis = .vertical

        sectionTitleLabel.textColor = .darkBlue
        sectionTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    }

    func defineLayoutForViews() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

}

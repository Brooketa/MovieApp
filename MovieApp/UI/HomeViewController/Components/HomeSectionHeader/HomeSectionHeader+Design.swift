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

        subcategoryScrollView = SubcategoryScrollView(subcategories: subcategories)
        stackView.addArrangedSubview(subcategoryScrollView)
    }

    func styleViews() {
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.axis = .vertical

        sectionTitleLabel.text = sectionTitle
        sectionTitleLabel.textColor = .darkBlue
        sectionTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    }

    func defineLayoutForViews() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

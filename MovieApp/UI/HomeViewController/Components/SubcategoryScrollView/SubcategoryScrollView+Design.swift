import UIKit
import SnapKit

extension SubcategoryScrollView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        contentView = UIView()
        addSubview(contentView)

        stackView = UIStackView()
        contentView.addSubview(stackView)

    }

    func styleViews() {
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        stackView.alignment = .leading
        stackView.axis = .horizontal

        hideIndicators()
    }

    func defineLayoutForViews() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func hideIndicators() {
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }

}

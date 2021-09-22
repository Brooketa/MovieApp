import Combine
import UIKit

class HomeSectionHeader: UICollectionReusableView {

    static let identifier = String(describing: HomeSectionHeader.self)

    var stackView: UIStackView!

    var sectionTitleLabel: UILabel!
    var subcategoryScrollView: SubcategoryScrollView!

    var subcategoryTap: AnyPublisher<Subcategory, Never> {
        subcategoryScrollView
            .buttonTap
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        defineLayoutForViews()
    }

    func setTitle(sectionTitle: String) {
        sectionTitleLabel.text = sectionTitle
    }

    func setSubcategories(subcategories: [Subcategory]) {
        subcategoryScrollView.setSubcategories(subcategories: subcategories)
    }
}

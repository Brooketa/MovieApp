import UIKit

class HomeSectionHeader: UICollectionReusableView {

    var stackView: UIStackView!

    var sectionTitleLabel: UILabel!
    var subcategoryScrollView: SubcategoryScrollView!

    let sectionTitle: String
    let subcategories: [Subcategory]

    init(sectionTitle: String, subcategories: [Subcategory]) {
        self.sectionTitle = sectionTitle
        self.subcategories = subcategories
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        defineLayoutForViews()
    }
}

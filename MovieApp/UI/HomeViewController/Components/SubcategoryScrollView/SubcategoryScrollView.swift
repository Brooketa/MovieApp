import UIKit

class SubcategoryScrollView: UIScrollView {

    let subcategories: [Subcategory]

    var contentView: UIView!
    var stackView: UIStackView!
    var subcategoryButtons = [UnderlinedButton]()

    init(subcategories: [Subcategory]) {
        self.subcategories = subcategories
        super.init(frame: .zero)

        buildViews()
        subcategoryButtons.first?.setSelected()
    }

    override init(frame: CGRect) {
        self.subcategories = [Subcategory]()
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        defineLayoutForViews()
    }

}

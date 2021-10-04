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

    var cancellables = Set<AnyCancellable>()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        cancellables = Set<AnyCancellable>()
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

    func setSelected(subcategory: Subcategory) {
        subcategoryScrollView.setSelected(subcategory: subcategory)
    }

}

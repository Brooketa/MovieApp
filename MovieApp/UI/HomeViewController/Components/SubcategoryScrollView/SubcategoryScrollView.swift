import Combine
import UIKit

class SubcategoryScrollView: UIScrollView {

    var contentView: UIView!
    var stackView: UIStackView!

    var buttonTap: AnyPublisher<Subcategory, Never>!

    override init(frame: CGRect) {
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

    func setSubcategories(subcategories: [Subcategory]) {
        let buttonTaps = subcategories
            .map { subcategory -> AnyPublisher<Subcategory, Never> in
                let button = UnderlinedButton(title: subcategory.description)
                button.setDeselected()
                stackView.addArrangedSubview(button)

                return configureButtonSubscription(button: button, subcategory: subcategory)
            }

        buttonTap = Publishers
            .MergeMany(buttonTaps)
            .eraseToAnyPublisher()

        let firstButton = stackView.subviews.first as? UnderlinedButton
        firstButton?.setSelected()
    }

    private func configureButtonSubscription(
        button: UnderlinedButton,
        subcategory: Subcategory
    ) -> AnyPublisher<Subcategory, Never> {
        button
            .tap
            .map { _ in subcategory }
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self = self else { return }

                self.stackView.subviews.forEach { subview in
                    if let stackButton = subview as? UnderlinedButton {
                        stackButton.setDeselected()
                    }
                }
                button.setSelected()
            })
            .eraseToAnyPublisher()
    }

}

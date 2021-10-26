import UIKit

class FavoriteButton: UIButton {

    init(selected: Bool) {
        super.init(frame: .zero)

        buildViews()
        isSelected = selected
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
        isSelected = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

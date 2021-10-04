import UIKit

class UnderlinedButton: UIButton {

    var line: UIView!

    init(title: String) {
        super.init(frame: .zero)

        buildViews()
        setTitle(title, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        defineLayoutForViews()
    }

    func setSelected() {
        line.isHidden = false
        changeTitleColor(color: .black)
        setFontToBold()
    }

    func setDeselected() {
        line.isHidden = true
        changeTitleColor(color: .underlinedButtonGray)
        setFontToRegular()
    }
}

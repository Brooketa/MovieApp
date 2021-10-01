import UIKit

class SignificantCrewView: UIView {

    var nameLabel: UILabel!
    var roleLabel: UILabel!

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        defineLayoutForViews()
    }

    func setCrewMember(name: String, role: String) {
        nameLabel.text = name
        roleLabel.text = role
    }

}

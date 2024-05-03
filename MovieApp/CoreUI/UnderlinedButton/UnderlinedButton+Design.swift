import UIKit
import SnapKit

extension UnderlinedButton: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        line = UIView()
        addSubview(line)
    }

    func styleViews() {
        changeTitleColor(color: .underlinedButtonTitle)
        setFontToRegular()

        line.backgroundColor = .underline
    }

    func defineLayoutForViews() {
        line.snp.makeConstraints { make in
            make.top.equalTo(self.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(3)
        }
    }

    func changeTitleColor(color: UIColor) {
        setTitleColor(color, for: .normal)
    }

    func setFontToBold() {
        titleLabel?.font = .heading3Bold
    }

    func setFontToRegular() {
        titleLabel?.font = .heading3
    }

}

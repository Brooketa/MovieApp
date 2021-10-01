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
        changeTitleColor(color: .black)
        setFontToRegular()

        line.backgroundColor = .darkBlue
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
        titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }

    func setFontToRegular() {
        titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    }

}

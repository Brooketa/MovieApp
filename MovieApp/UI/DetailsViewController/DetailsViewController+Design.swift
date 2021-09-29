import UIKit
import SnapKit

extension DetailsViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {}

    func styleViews() {
        setDefaultNavBar()
        view.backgroundColor = .white
    }

    func defineLayoutForViews() {}

}

import UIKit

extension HomeViewController: ConstructViewsProtocol {

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

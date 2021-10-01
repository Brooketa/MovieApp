import UIKit

extension FavoriteButton: ConstructViewsProtocol {

    func buildViews() {
        styleViews()
    }

    func createViews() {}

    func styleViews() {
        setImage(UIImage(named: "favorite-button-normal"), for: .normal)
        setImage(UIImage(named: "favorite-button-highlighted"), for: .selected)
        configureButtonAction()
    }

    func defineLayoutForViews() {}

    func configureButtonAction() {
        self.addTarget(self, action: #selector(changeAppearance(_:)), for: .touchUpInside)
    }

}

import UIKit

extension UIViewController {

    public func setDefaultNavBar() {
        guard let navigationController = navigationController else { return }

        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = .navBarColor
        navigationController.navigationBar.tintColor = .white
        navigationItem.titleView = UIImageView(image: UIImage(named: "tmdb-logo"))
    }

}

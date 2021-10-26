import UIKit

extension UIViewController {

    public func setDefaultNavBar() {
        guard let navigationController = navigationController else { return }

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .darkBlue
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance

        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = .white
        navigationItem.titleView = UIImageView(image: UIImage(named: "tmdb-logo"))
    }

    public func setDefaultBackButtonTitle() {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }

}

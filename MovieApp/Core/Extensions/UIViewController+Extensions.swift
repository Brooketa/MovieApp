import UIKit

extension UIViewController {

    public func setDefaultNavBar() {
        guard let navigationController = navigationController else { return }

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .navigationBackground
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance

        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.tintColor = .white
        let logoImageView = UIImageView(image: UIImage(named: "tmdb-logo"))
        logoImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 16)
        navigationItem.titleView = logoImageView
    }

    public func setDefaultBackButtonTitle() {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }

}

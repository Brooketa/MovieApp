import UIKit
import Resolver

class AppRouter: AppRouterProtocol {

    private let container: Resolver

    private var tabBarController: UITabBarController?
    private var homeNavigationController: UINavigationController?
    private var favoritesNavigationController: UINavigationController?

    init(container: Resolver) {
        self.tabBarController = UITabBarController()
        self.homeNavigationController = UINavigationController()
        self.favoritesNavigationController = UINavigationController()
        self.container = container
    }

    func start(in window: UIWindow) {
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }

    private func configureTabBarController() {
        guard
            let tabBarController = tabBarController,
            let homeNavigationController = homeNavigationController,
            let favoritesNavigationController = favoritesNavigationController
        else {
            return
        }

        let homeViewController: HomeViewController = container.resolve()
        let favoritesViewController: FavoritesViewController = container.resolve()

        homeViewController.tabBarItem = createTabBarItem(
            title: "Favorites",
            selectedImageName: "home-selected",
            deselectedImageName: "home-deselected")

        favoritesViewController.tabBarItem = createTabBarItem(
            title: "Favorites",
            selectedImageName: "favorites-selected",
            deselectedImageName: "favorites-deselected")

        homeNavigationController.setViewControllers([homeViewController], animated: true)
        favoritesNavigationController.setViewControllers([favoritesViewController], animated: true)

        tabBarController.viewControllers = [homeNavigationController, favoritesNavigationController]
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .white
    }

    private func createTabBarItem(
        title: String,
        selectedImageName: String,
        deselectedImageName: String
    ) -> UITabBarItem {
        guard
            let selectedImage = UIImage(named: selectedImageName)?
                .withRenderingMode(.alwaysOriginal),
            let deselectedImage = UIImage(named: deselectedImageName)
        else {
            return UITabBarItem()
        }

        let tabBarItem = UITabBarItem(title: title, image: deselectedImage, selectedImage: selectedImage)
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkBlue], for: .normal)
        return tabBarItem
    }

    func showHome() {
        configureTabBarController()
    }

}

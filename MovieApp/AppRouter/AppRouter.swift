import UIKit
import Resolver

class AppRouter: AppRouterProtocol {

    private let container: Resolver

    private var navigationController: UINavigationController?

    init(container: Resolver) {
        self.navigationController = UINavigationController()
        self.container = container
    }

    func start(in window: UIWindow) {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func showHome() {
        guard let navigationController = navigationController else { return }

        let homeViewController: FavoritesViewController = container.resolve()
        navigationController.setViewControllers([homeViewController], animated: true)
    }

}

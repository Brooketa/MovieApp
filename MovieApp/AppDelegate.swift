import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let navigationController = UINavigationController()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        guard let window = window else { return false }

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        let homeViewController = HomeViewController(with: HomepagePresenter())
        navigationController.viewControllers = [homeViewController]
        return true
    }

}

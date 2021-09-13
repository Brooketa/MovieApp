import UIKit
import Resolver

class AppModule {

    private let navigationController = UINavigationController()

    private lazy var container: Resolver = {
        let container = Resolver()
        registerDependencies(in: container)
        return container
    }()

    func start(in window: UIWindow) {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        let homepageViewController: HomeViewController = container.resolve()
        navigationController.setViewControllers([homepageViewController], animated: true)
    }

}

private extension AppModule {

    func registerDependencies(in container: Resolver) {
        registerClients(in: container)
        registerDataSources(in: container)
        registerRepositories(in: container)
        registerUseCases(in: container)
        registerPresenters(in: container)
        registerViewControllers(in: container)
    }

    private func registerClients(in container: Resolver) {
        container
            .register { MovieClient() }
            .implements(MovieClientProtocol.self)
            .scope(.application)
    }

    private func registerDataSources(in container: Resolver) {
        container
            .register { MovieDataSource(movieClient: container.resolve()) }
            .implements(MovieDataSourceProtocol.self)
            .scope(.application)
    }

    private func registerRepositories(in container: Resolver) {
        container
            .register { MovieRepository(movieDataSource: container.resolve()) }
            .implements(MovieRepositoryProtocol.self)
            .scope(.application)
    }

    private func registerUseCases(in container: Resolver) {
        container
            .register { MovieUseCase(movieRepository: container.resolve()) }
            .implements(MovieUseCaseProtocol.self)
            .scope(.application)
    }

    private func registerPresenters(in container: Resolver) {
        container
            .register { HomepagePresenter(movieUseCase: container.resolve()) }
            .scope(.unique)
    }

    private func registerViewControllers(in container: Resolver) {
        container
            .register { HomeViewController(presenter: container.resolve()) }
            .scope(.unique)
    }

}

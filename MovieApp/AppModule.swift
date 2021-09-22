import UIKit
import Resolver

class AppModule {

    private lazy var container: Resolver = {
        let container = Resolver()
        registerDependencies(in: container)
        return container
    }()

    private lazy var appRouter: AppRouter = {
        container.resolve()
    }()

    func start(in window: UIWindow) {
        appRouter.start(in: window)
        appRouter.showHome()
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
        registerAppRouter(in: container)
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
            .register { SearchPresenter(movieUseCase: container.resolve()) }
            .scope(.unique)

        container
            .register { HomePresenter(movieUseCase: container.resolve()) }
            .scope(.unique)
    }

    private func registerViewControllers(in container: Resolver) {
        container
            .register { SearchViewController(presenter: container.resolve()) }
            .scope(.unique)

        container
            .register { HomeViewController(presenter: container.resolve()) }
            .scope(.unique)
    }

    private func registerAppRouter(in container: Resolver) {
        container
            .register {
                AppRouter(container: container)
            }
            .implements(AppRouterProtocol.self)
            .scope(.application)
    }

}
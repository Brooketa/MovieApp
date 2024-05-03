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
            .register { BaseClient() }
            .implements(BaseClientProtocol.self)
            .scope(.application)

        container
            .register { MovieClient(baseClient: container.resolve()) }
            .implements(MovieClientProtocol.self)
            .scope(.application)

        container
            .register { DetailsClient(baseClient: container.resolve()) }
            .implements(DetailsClientProtocol.self)
            .scope(.application)

        container
            .register { SearchClient(baseClient: container.resolve()) }
            .implements(SearchClientProtocol.self)
            .scope(.application)

        container
            .register { FavoritesClient(baseClient: container.resolve()) }
            .implements(FavoritesClientProtocol.self)
            .scope(.application)
    }

    private func registerDataSources(in container: Resolver) {
        container
            .register { MovieDataSource(movieClient: container.resolve()) }
            .implements(MovieDataSourceProtocol.self)
            .scope(.application)

        container
            .register { DetailsDataSource(detailsClient: container.resolve()) }
            .implements(DetailsDataSourceProtocol.self)
            .scope(.application)

        container
            .register { SearchDataSource(searchClient: container.resolve()) }
            .implements(SearchDataSourceProtocol.self)
            .scope(.application)

        container
            .register { FavoritesDataSource(favoritesClient: container.resolve()) }
            .implements(FavoritesDataSourceProtocol.self)
            .scope(.application)

        container
            .register { FavoritesLocalDataSource() }
            .implements(FavoritesLocalDataSourceProtocol.self)
            .scope(.application)
    }

    private func registerRepositories(in container: Resolver) {
        container
            .register {
                MovieRepository(
                    movieDataSource: container.resolve(),
                    favoritesDataSource: container.resolve())
            }
            .implements(MovieRepositoryProtocol.self)
            .scope(.application)

        container
            .register { DetailsRepository(detailsDataSource: container.resolve()) }
            .implements(DetailsRepositoryProtocol.self)
            .scope(.application)

        container
            .register { SearchRepository(searchDataSource: container.resolve()) }
            .implements(SearchRepositoryProtocol.self)
            .scope(.application)

        container
            .register {
                FavoritesRepository(
                    favoritesDataSource: container.resolve(),
                    favoritesLocalDataSource: container.resolve())
            }
            .implements(FavoritesRepositoryProtocol.self)
            .scope(.application)
    }

    private func registerUseCases(in container: Resolver) {
        container
            .register { MovieUseCase(movieRepository: container.resolve()) }
            .implements(MovieUseCaseProtocol.self)
            .scope(.application)

        container
            .register { DetailsUseCase(detailsRepository: container.resolve()) }
            .implements(DetailsUseCaseProtocol.self)
            .scope(.application)

        container
            .register { SearchUseCase(searchRepository: container.resolve()) }
            .implements(SearchUseCaseProtocol.self)
            .scope(.application)

        container
            .register { FavoritesUseCase(favoritesRepository: container.resolve()) }
            .implements(FavoritesUseCaseProtocol.self)
            .scope(.application)
    }

    private func registerPresenters(in container: Resolver) {
        container
            .register { SearchPresenter(searchUseCase: container.resolve(), appRouter: container.resolve()) }
            .scope(.unique)

        container
            .register { HomePresenter(movieUseCase: container.resolve(), appRouter: container.resolve()) }
            .scope(.unique)

        container
            .register { DetailsPresenter(detailsUseCase: container.resolve(), appRouter: container.resolve()) }
            .scope(.unique)

        container
            .register { FavoritesPresenter(favoritesUseCase: container.resolve(), appRouter: container.resolve()) }
            .scope(.unique)
    }

    private func registerViewControllers(in container: Resolver) {
        container
            .register { DetailsViewController(presenter: container.resolve()) }
            .scope(.unique)

        container
            .register { HomeViewController(presenter: container.resolve()) }
            .scope(.unique)

        container
            .register { SearchViewController(presenter: container.resolve()) }
            .scope(.unique)

        container
            .register { FavoritesViewController(presenter: container.resolve()) }
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

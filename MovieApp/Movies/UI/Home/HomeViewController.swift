import Combine
import UIKit
import Resolver

class HomeViewController: UIViewController {

    typealias MovieDataSource = UICollectionViewDiffableDataSource<HomeSection, MovieViewModel>
    private typealias MovieSnapshot = NSDiffableDataSourceSnapshot<HomeSection, MovieViewModel>

    var collectionView: UICollectionView!

    private var homePresenter: HomePresenter!
    private var movieDataSource: MovieDataSource!
    private var movieSnapshot: MovieSnapshot!

    private var selectedSubcategories: [HomeSection: Subcategory] = [.whatsPopular: .action,
                                                                     .topRated: .action,
                                                                     .trending: .today]

    private var cancellables = Set<AnyCancellable>()

    init(presenter: HomePresenter) {
        homePresenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        movieDataSource = makeMovieDataSource()
        getAllMovies()
    }

    private func getAllMovies() {
        HomeSection.allCases.forEach { section in
            guard let selectedSubcategory = self.selectedSubcategories[section] else { return }

            homePresenter
                .movies(section: section, subcategory: selectedSubcategory)
                .eraseToAnyPublisher()
                .sink { [weak self] movies in
                    guard let self = self else { return }

                    self.updateMovieDataSource(with: movies, for: section) }
                .store(in: &cancellables)
        }
    }

    private func makeMovieDataSource() -> MovieDataSource {
        let movieDataSource = MovieDataSource(
            collectionView: collectionView,
            cellProvider: { [weak self] collectionView, indexPath, movieViewModel in
                guard let self = self else { return nil }

                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: MovieCollectionViewCell.identifier,
                        for: indexPath) as? MovieCollectionViewCell
                else {
                    return UICollectionViewCell()
                }

                cell.set(viewModel: movieViewModel)
                self.configureFavoriteButtonSubscription(cell: cell, movieID: movieViewModel.movieID)
                return cell
            })

        movieDataSource.supplementaryViewProvider = { [weak self] (collectionView, kind, indexPath) in
            guard let self = self else { return nil }

            guard
                let header = self.getHomeSectionHeader(
                collectionView: collectionView,
                kind: kind,
                indexPath: indexPath)
            else {
                return nil
            }

            return header
        }

        movieSnapshot = MovieSnapshot()
        movieSnapshot.appendSections([.whatsPopular, .topRated, .trending])

        return movieDataSource
    }

    private func updateMovieDataSource(with viewModels: [MovieViewModel], for section: HomeSection) {
        movieSnapshot.deleteItems(movieSnapshot.itemIdentifiers(inSection: section))
        movieSnapshot.appendItems(viewModels, toSection: section)
        movieDataSource.apply(movieSnapshot, animatingDifferences: false, completion: nil)
    }

    private func configureFavoriteButtonSubscription(cell: MovieCollectionViewCell, movieID: Int) {
        cell
            .favoriteButton
            .tap
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }

                self.homePresenter.toggleFavoriteMovie(movieID: movieID)
            })
            .store(in: &cell.cancellables)
    }

    // MARK: HomeSectionHeader Configuration
    private func getHomeSectionHeader(
        collectionView: UICollectionView,
        kind: String,
        indexPath: IndexPath
    ) -> HomeSectionHeader? {

        guard
            let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HomeSectionHeader.identifier,
            for: indexPath) as? HomeSectionHeader
        else {
            return nil
        }

        let section = self.movieDataSource.snapshot().sectionIdentifiers[indexPath.section]
        configureSectionHeader(sectionHeader: header, section: section)

        return header
    }

    private func configureSectionHeader(sectionHeader: HomeSectionHeader, section: HomeSection) {
        let sectionTitle: String

        switch section {
        case .whatsPopular, .topRated:
            sectionTitle = section == .whatsPopular ? "What's popular" : "Top rated"
            sectionHeader.setSubcategories(
                subcategories: [
                    .action, .adventure, .comedy, .documentary,
                    .drama, .horror, .scienceFiction, .thriller
                ])
        case .trending:
            sectionTitle = "Trending"
            sectionHeader.setSubcategories(
                subcategories: [.today, .week])
        }

        sectionHeader.setTitle(sectionTitle: sectionTitle)
        configureSectionHeaderSubscription(sectionHeader: sectionHeader, section: section)

        guard let selectedSubcategory = selectedSubcategories[section] else { return }

        sectionHeader.setSelected(subcategory: selectedSubcategory)
    }

    private func configureSectionHeaderSubscription(sectionHeader: HomeSectionHeader, section: HomeSection) {
        sectionHeader
            .subcategoryTap
            .flatMap { [weak self] subcategory -> AnyPublisher<[MovieViewModel], Never> in
                guard let self = self else { return Empty<[MovieViewModel], Never>().eraseToAnyPublisher() }

                self.selectedSubcategories[section] = subcategory

                return self.homePresenter
                    .movies(section: section, subcategory: subcategory)
                    .eraseToAnyPublisher()
            }
            .sink { [weak self] movies in
                guard let self = self else { return }

                self.updateMovieDataSource(with: movies, for: section)
            }
            .store(in: &sectionHeader.cancellables)
    }

}

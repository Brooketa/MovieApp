import Combine
import UIKit

class HomeViewController: UIViewController {

    private typealias MovieDataSource = UICollectionViewDiffableDataSource<HomeSection, MovieViewModel>
    private typealias MovieSnapshot = NSDiffableDataSourceSnapshot<HomeSection, MovieViewModel>

    var sectionHeader: HomeSectionHeader!
    var collectionView: UICollectionView!

    private var homePresenter: HomePresenter!
    private var movieDataSource: MovieDataSource!

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

        fetchMovies(section: .trending, subcategory: .action)
    }

    private func makeMovieDataSource() -> MovieDataSource {
        let movieDataSource = MovieDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, movieViewModel in
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: HomeCollectionViewCell.identifier,
                        for: indexPath) as? HomeCollectionViewCell
                else {
                    return UICollectionViewCell()
                }

                cell.set(viewModel: movieViewModel)

                return cell
            })

        return movieDataSource
    }

    private func updateMovieDataSource(with viewModels: [MovieViewModel], for section: HomeSection) {
        var movieSnapshot = MovieSnapshot()
        movieSnapshot.appendSections([section])
        movieSnapshot.appendItems(viewModels)

        movieDataSource.apply(movieSnapshot, animatingDifferences: true, completion: nil)
    }

    private func fetchMovies(section: HomeSection, subcategory: Subcategory) {
        homePresenter
            .movies(subcategory: subcategory)
            .sink { [weak self] movies in
                guard let self = self else { return }

                self.updateMovieDataSource(with: movies, for: section)
            }
            .store(in: &cancellables)
    }

}

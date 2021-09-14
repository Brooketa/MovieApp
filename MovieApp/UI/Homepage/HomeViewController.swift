import Combine
import UIKit

class HomeViewController: UIViewController {

    enum Section {

        case main

    }

    private typealias TrendingDataSource = UICollectionViewDiffableDataSource<Section, MovieViewModel>
    private typealias TrendingSnapshot = NSDiffableDataSourceSnapshot<Section, MovieViewModel>

    var collectionView: UICollectionView!

    private var homepagePresenter: HomepagePresenter!
    private var trendingDataSource: TrendingDataSource!

    private var cancellables = Set<AnyCancellable>()

    init(presenter: HomepagePresenter) {
        homepagePresenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        trendingDataSource = makeTrendingDataSource()

        homepagePresenter
            .trendingMovies
            .sink(
                receiveValue: { [weak self] movies in
                    guard let self = self else { return }

                    self.updateTrendingDataSource(with: movies)
                })
            .store(in: &cancellables)
    }

    private func makeTrendingDataSource() -> TrendingDataSource {
        TrendingDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, movieViewModel in
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: MovieCollectionViewCell.identifier,
                        for: indexPath) as? MovieCollectionViewCell
                else {
                    return UICollectionViewCell()
                }

                cell.set(viewModel: movieViewModel)

                return cell
            })
    }

    private func updateTrendingDataSource(with viewModels: [MovieViewModel]) {
        var trendingSnapshot = TrendingSnapshot()
        trendingSnapshot.appendSections([.main])
        trendingSnapshot.appendItems(viewModels)

        trendingDataSource.apply(trendingSnapshot, animatingDifferences: true, completion: nil)
    }

}

import Combine
import UIKit

class FavoritesViewController: UIViewController {

    private typealias FavoritesDataSource = UICollectionViewDiffableDataSource
    <FavoritesSection,
     FavoritesMovieViewModel>
    private typealias FavoritesSnapshot = NSDiffableDataSourceSnapshot<FavoritesSection, FavoritesMovieViewModel>

    var favoritesLabel: UILabel!
    var collectionView: UICollectionView!

    private var favoritesPresenter: FavoritesPresenter!
    private var favoritesDataSource: FavoritesDataSource!
    private var favoritesSnapshot: FavoritesSnapshot!

    private var cancellables = Set<AnyCancellable>()

    init(presenter: FavoritesPresenter) {
        favoritesPresenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        favoritesDataSource = makeFavoritesDataSource()

        getFavoriteMovies()
    }

    private func getFavoriteMovies() {
        favoritesPresenter
            .favoriteMovies
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { movie in
                    self.updateFavoritesDataSource(with: movie)
                }
            )
            .store(in: &cancellables)
    }

    private func makeFavoritesDataSource() -> FavoritesDataSource {
        let favoritesDataSource = FavoritesDataSource(
            collectionView: collectionView,
            cellProvider: { [weak self] collectionView, indexPath, favoriteMovieViewModel in
                guard let self = self else { return nil }

                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: MovieCollectionViewCell.identifier,
                        for: indexPath) as? MovieCollectionViewCell
                else {
                    return UICollectionViewCell()
                }

                cell.set(viewModel: favoriteMovieViewModel)
                self.configureFavoriteButtonSubscription(cell: cell, movieID: favoriteMovieViewModel.movieID)
                return cell
            })

        favoritesSnapshot = FavoritesSnapshot()
        favoritesSnapshot.appendSections([.main])

        return favoritesDataSource
    }

    private func updateFavoritesDataSource(with viewModel: FavoritesMovieViewModel) {
        favoritesSnapshot.appendItems([viewModel], toSection: FavoritesSection.main)
        favoritesDataSource.apply(favoritesSnapshot, animatingDifferences: true, completion: nil)
    }

    private func clearFavoritesDataSource() {
        favoritesSnapshot.deleteItems(favoritesSnapshot.itemIdentifiers(inSection: FavoritesSection.main))
        favoritesDataSource.apply(favoritesSnapshot, animatingDifferences: true, completion: nil)
    }

    private func configureFavoriteButtonSubscription(cell: MovieCollectionViewCell, movieID: Int) {
        cell.favoriteButton
            .tap
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }

                self.clearFavoritesDataSource()
                self.favoritesPresenter.toggleFavoriteMovie(movieID: movieID)
            })
            .store(in: &cell.cancellables)
    }

}

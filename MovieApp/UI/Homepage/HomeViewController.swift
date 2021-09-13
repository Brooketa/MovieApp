import Combine
import UIKit

class HomeViewController: UIViewController {

    let homepagePresenter: HomepagePresenter

    var collectionView: UICollectionView!

    private var cancellables = Set<AnyCancellable>()
    private var movieViewModels = [MovieViewModel]()

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

        homepagePresenter
            .trendingMovies
            .sink(
                receiveValue: { [weak self] movies in
                    guard let self = self else { return }

                    self.movieViewModels = movies
                    self.collectionView.reloadData()
                })
            .store(in: &cancellables)
    }

}

extension HomeViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}

}

extension HomeViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieViewModels.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MovieCollectionViewCell.identifier,
                for: indexPath) as? MovieCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        cell.set(viewModel: movieViewModels[indexPath.row])

        return cell
    }

}

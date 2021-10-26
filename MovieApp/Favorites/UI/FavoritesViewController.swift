import UIKit

class FavoritesViewController: UIViewController {

    var favoritesLabel: UILabel!
    var collectionView: UICollectionView!

    private var favoritesPresenter: FavoritesPresenter!

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
    }

}

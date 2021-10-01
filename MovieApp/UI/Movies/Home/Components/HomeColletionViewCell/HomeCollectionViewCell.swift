import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: HomeCollectionViewCell.self)

    var movieImageView: UIImageView!
    var favoriteButton: FavoriteButton!

    public override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        buildViews()
    }

    public override func didMoveToSuperview() {
        super.didMoveToSuperview()

        defineLayoutForViews()
    }

    public func set(viewModel: MovieViewModel) {
        movieImageView.kf.setImage(with: viewModel.moviePosterImageURL)
    }
}

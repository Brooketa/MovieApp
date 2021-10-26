import Combine
import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: MovieCollectionViewCell.self)

    var movieImageView: UIImageView!
    var favoriteButton: FavoriteButton!

    var cancellables = Set<AnyCancellable>()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        buildViews()
    }

    override func prepareForReuse() {
        cancellables = Set<AnyCancellable>()
    }

    public override func didMoveToSuperview() {
        super.didMoveToSuperview()

        defineLayoutForViews()
    }

    public func set(viewModel: MovieViewModel) {
        movieImageView.kf.setImage(with: viewModel.moviePosterImageURL)
        favoriteButton.isSelected = viewModel.isFavorite
    }

    public func set(viewModel: FavoritesMovieViewModel) {
        movieImageView.kf.setImage(with: viewModel.moviePosterImageURL)
        favoriteButton.isSelected = viewModel.isFavorite
    }

}

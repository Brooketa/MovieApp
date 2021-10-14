import UIKit
import Kingfisher

class SearchCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: SearchCollectionViewCell.self)

    var movieImageView: UIImageView!
    var movieTitleLabel: UILabel!
    var movieDescriptionLabel: UILabel!

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

    public func set(viewModel: SearchMovieViewModel) {
        movieImageView.kf.setImage(
            with: viewModel.moviePosterImageURL,
            placeholder: UIImage(named: "movie-placeholder"))
        movieTitleLabel.text = viewModel.movieTitle
        movieDescriptionLabel.text = viewModel.movieDescription
    }

}

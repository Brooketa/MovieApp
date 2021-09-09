import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: MovieCollectionViewCell.self)

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

    public func set(viewModel: MovieViewModel) {
        movieImageView.kf.setImage(with: viewModel.movieImageURL)
        movieTitleLabel.text = viewModel.movieTitle
        movieDescriptionLabel.text = viewModel.movieDescription
    }

}

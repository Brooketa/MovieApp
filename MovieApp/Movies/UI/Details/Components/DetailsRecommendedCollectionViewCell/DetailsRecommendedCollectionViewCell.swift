import UIKit
import Kingfisher

class DetailsRecommendedCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DetailsRecommendedCollectionViewCell.self)

    var backdropImageView: UIImageView!
    var movieTitleLabel: UILabel!

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        defineLayoutForViews()
    }

    func set(viewModel: RecommendedMovieViewModel) {
        backdropImageView.kf.setImage(
            with: viewModel.backdropImageURL,
            placeholder: UIImage(named: "movie-recommended-placeholder"))
        movieTitleLabel.text = viewModel.title
    }

}

import UIKit
import SnapKit

extension MovieCollectionViewCell: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        movieImageView = UIImageView()
        contentView.addSubview(movieImageView)

        favoriteButton = FavoriteButton()
        contentView.addSubview(favoriteButton)
    }

    func styleViews() {
        addShadow()
        configureRoundedCorners()
        movieImageView.clipsToBounds = true
    }

    func defineLayoutForViews() {
        movieImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        favoriteButton.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(15)
            make.size.equalTo(25)
        }
    }

}

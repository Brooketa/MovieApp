import UIKit
import SnapKit

extension DetailsHeaderView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        posterImageView = UIImageView()
        addSubview(posterImageView)

        gradientView = UIView()
        addSubview(gradientView)

        progressView = ProgressView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        addSubview(progressView)

        userScoreLabel = UILabel()
        addSubview(userScoreLabel)

        titleLabel = UILabel()
        addSubview(titleLabel)

        dateReleasedLabel = UILabel()
        addSubview(dateReleasedLabel)

        genresLabel = UILabel()
        addSubview(genresLabel)

        favoriteButton = FavoriteButton()
        addSubview(favoriteButton)
    }

    func styleViews() {
        backgroundColor = .primaryBackground

        posterImageView.clipsToBounds = true
        posterImageView.contentMode = .scaleAspectFill

        gradientView.alpha = 0.0

        userScoreLabel.text = LocalizableString.detailsUserScore.localized
        userScoreLabel.textColor = .white
        userScoreLabel.font = .textBold

        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = .movieTitleBold
        dateReleasedLabel.textColor = .white
        dateReleasedLabel.textAlignment = .left
        dateReleasedLabel.font = .textRegular

        genresLabel.textColor = .white
        genresLabel.textAlignment = .left
        genresLabel.font = .textRegular
        genresLabel.numberOfLines = 0
    }

    func defineLayoutForViews() {
        posterImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.size.equalTo(self.snp.width)
        }

        gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        progressView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalTo(titleLabel.snp.top).offset(-15)
            make.size.equalTo(50)
        }

        userScoreLabel.snp.makeConstraints { make in
            make.leading.equalTo(progressView.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalTo(progressView.snp.centerY)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalTo(dateReleasedLabel.snp.top).offset(-10)
        }

        dateReleasedLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalTo(genresLabel.snp.top).offset(-5)
        }

        genresLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalTo(favoriteButton.snp.top).offset(-5)
        }

        favoriteButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-15)
            make.size.equalTo(50)
        }
    }

    func makeBackgroundGradient() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.0, 1]

        return gradientLayer
    }

}

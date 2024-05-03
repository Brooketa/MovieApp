import UIKit
import Kingfisher

class DetailsHeaderView: UIView {

    var posterImageView: UIImageView!
    var gradientView: UIView!

    var progressView: ProgressView!
    var userScoreLabel: UILabel!

    var titleLabel: UILabel!
    var dateReleasedLabel: UILabel!
    var genresLabel: UILabel!

    var favoriteButton: FavoriteButton!

    private let titleYearAttributes = [NSAttributedString.Key.font: UIFont.movieTitleRegular]
    private let durationAttributes = [NSAttributedString.Key.font: UIFont.textBold]

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

    func setHeader(from viewModel: DetailsHeaderViewModel) {
        posterImageView.kf.setImage(with: viewModel.movieBackdropImageURL)
        progressView.setProgress(progress: viewModel.rating / 10)
        titleLabel.attributedText = titleAttributedText(title: viewModel.movieTitle, year: viewModel.releaseYear)
        dateReleasedLabel.text = viewModel.releaseDate.description
        genresLabel.attributedText = genreAttributedText(
            genres: viewModel.movieGenres,
            duration: viewModel.duration)
    }

    public func configureGradient() {
        gradientView.layer.addSublayer(makeBackgroundGradient())

        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }

            self.gradientView.alpha = 1.0
        }
    }

    private func titleAttributedText(title: String, year: Int) -> NSMutableAttributedString {
        let titleString = NSMutableAttributedString(string: title)
        let yearString = NSAttributedString(string: " (\(year))", attributes: titleYearAttributes)
        titleString.append(yearString)

        return titleString
    }

    private func genreAttributedText(genres: [MovieGenreViewModel], duration: Int) -> NSMutableAttributedString {
        let genresAttString = NSMutableAttributedString(string: genres.map { $0.genre }.joined(separator: ", "))
        let durationAttString = NSAttributedString(
            string: " \(minutesToHoursMinutes(minutes: duration))",
            attributes: durationAttributes)
        genresAttString.append(durationAttString)

        return genresAttString
    }

    private func minutesToHoursMinutes(minutes: Int) -> String {
        return "\(minutes / 60)h \(minutes % 60)m"
    }
}

import UIKit

class DetailsHeaderView: UIView {

    var posterImageView: UIImageView!
    var gradientView: UIView!

    var progressView: ProgressView!
    var userScoreLabel: UILabel!

    var titleLabel: UILabel!
    var dateReleasedLabel: UILabel!
    var genresLabel: UILabel!

    var favoriteButton: FavoriteButton!

    private let titleYearAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .regular)]
    private let durationAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)]

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

    func set(viewModel: MovieViewModel?) {
        progressView.setProgress(progress: 0)
        titleLabel.attributedText = titleAttributedText(title: "", year: 0)
        dateReleasedLabel.text = ""
        genresLabel.attributedText = genreAttributedText(
            genres: [""],
            duration: 0)
    }

    private func titleAttributedText(title: String, year: Int) -> NSMutableAttributedString {
        let titleString = NSMutableAttributedString(string: title)
        let yearString = NSAttributedString(string: " (\(year))", attributes: titleYearAttributes)
        titleString.append(yearString)

        return titleString
    }

    private func genreAttributedText(genres: [String], duration: Int) -> NSMutableAttributedString {
        let genresAttString = NSMutableAttributedString(string: genres.joined(separator: ", "))
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

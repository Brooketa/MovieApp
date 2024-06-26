import UIKit
import Kingfisher

class DetailsReviewAuthorView: UIView {

    var authorAvatarImageView: UIImageView!
    var stackView: UIStackView!
    var titleLabel: UILabel!
    var writtenByLabel: UILabel!

    private let usernameColorAttributes = [NSAttributedString.Key.foregroundColor: UIColor.secondaryTitle]
    private let grayColorAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]

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

    func set(from viewModel: ReviewAuthorViewModel, createdAt: String) {
        authorAvatarImageView.kf.setImage(
            with: viewModel.authorAvatarURL,
            placeholder: UIImage(named: "author-placeholder"))
        titleLabel.text = "A review by \(viewModel.authorUsername)"
        writtenByLabel.attributedText = writtenByAttributedText(
            authorUsername: viewModel.authorUsername,
            createdAt: createdAt)
    }

    private func writtenByAttributedText(authorUsername: String, createdAt: String) -> NSMutableAttributedString {
        let writtenByString = NSMutableAttributedString(string: LocalizableString.detailsWrittenBy.localized)
        let usernameString = NSAttributedString(string: authorUsername, attributes: usernameColorAttributes)
        let dateString = NSAttributedString(string: " on \(createdAt)", attributes: grayColorAttributes)
        writtenByString.append(usernameString)
        writtenByString.append(dateString)

        return writtenByString
    }
}

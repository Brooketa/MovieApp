import Combine
import UIKit

class DetailsReviewView: UIView {

    var socialLabel: UILabel!
    var authorView: DetailsReviewAuthorView!
    var contentLabel: UILabel!

    private var cancellables = Set<AnyCancellable>()

    private let showMore = "show more"
    private let showLess = "show less"

    private let darkBlueColorAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkBlue]

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

    func setReview(from viewModel: DetailsReviewViewModel) {
        guard let reviewViewModel = viewModel.reviews.first else { return }

        authorView.set(from: reviewViewModel.author, createdAt: reviewViewModel.createdAt)
        contentLabel.attributedText = reviewAttributedText(
            reviewContent: reviewViewModel.reviewContent,
            shouldExpand: false)

        contentLabel
            .tap
            .sink(receiveValue: { [weak self] gesture in
                guard let self = self else { return }

                guard let tapGesture = gesture.recognizer as? UITapGestureRecognizer else { return }

                self.handleLabelTap(gesture: tapGesture, reviewContent: reviewViewModel.reviewContent)
            })
            .store(in: &cancellables)
    }

    private func reviewAttributedText(reviewContent: String, shouldExpand: Bool) -> NSMutableAttributedString {
        let reviewString = NSMutableAttributedString(
            string: shouldExpand ? "\(reviewContent) " : "\(String(reviewContent.prefix(100)))... ")

        let readMoreString = NSAttributedString(
            string: shouldExpand ? showLess : showMore,
            attributes: darkBlueColorAttributes)

        reviewString.append(readMoreString)

        return reviewString
    }

    private func handleLabelTap(gesture: UITapGestureRecognizer, reviewContent: String) {
        if gesture.state == .ended {
            guard let attributedString = contentLabel.attributedText else { return }

            let showMoreRange = (attributedString.string as NSString).range(of: showMore)
            let showLessRange = (attributedString.string as NSString).range(of: showLess)

            if gesture.didTapAttributedTextInLabel(label: contentLabel, inRange: showMoreRange) {
                contentLabel.attributedText = reviewAttributedText(reviewContent: reviewContent, shouldExpand: true)
            } else if gesture.didTapAttributedTextInLabel(label: contentLabel, inRange: showLessRange) {
                contentLabel.attributedText = reviewAttributedText(
                    reviewContent: reviewContent,
                    shouldExpand: false)
            }
       }
    }
}

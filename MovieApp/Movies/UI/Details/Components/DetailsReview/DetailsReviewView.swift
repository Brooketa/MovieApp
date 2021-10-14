import Combine
import UIKit

class DetailsReviewView: UIView {

    var socialLabel: UILabel!
    var authorView: DetailsReviewAuthorView!
    var contentLabel: UILabel!

    private var cancellables = Set<AnyCancellable>()

    private let readTheRest = "read the rest"
    private let hide = "hide"

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

    public func set(from model: ReviewViewModel) {
        authorView.set(from: model.author, createdAt: model.createdAt)
        contentLabel.attributedText = reviewAttributedText(reviewContent: model.reviewContent, shouldExpand: false)
        contentLabel
            .tap
            .sink(receiveValue: { [weak self] gesture in
                guard let self = self else { return }

                guard let tapGesture = gesture.recognizer as? UITapGestureRecognizer else { return }

                self.handleLabelTap(gesture: tapGesture, reviewContent: model.reviewContent)
            })
            .store(in: &cancellables)
    }

    private func reviewAttributedText(reviewContent: String, shouldExpand: Bool) -> NSMutableAttributedString {
        let reviewString = NSMutableAttributedString(
            string: shouldExpand ? "\(reviewContent) " : "\(String(reviewContent.prefix(100)))... ")

        let readMoreString = NSAttributedString(
            string: shouldExpand ? hide : readTheRest,
            attributes: darkBlueColorAttributes)

        reviewString.append(readMoreString)

        return reviewString
    }

    private func handleLabelTap(gesture: UITapGestureRecognizer, reviewContent: String) {
        let readMoreStartLocation = 108
        let readMoreRange = NSRange(location: readMoreStartLocation, length: readTheRest.count)
        let hideRange = NSRange(location: reviewContent.count + 1, length: hide.count)

        if gesture.state == .ended {
            guard let attributedString = contentLabel.attributedText else { return }
            let textStorage = NSTextStorage(attributedString: attributedString)

            let layoutManager = NSLayoutManager()
            textStorage.addLayoutManager(layoutManager)

            let textContainer = NSTextContainer(size: contentLabel.bounds.size)
            layoutManager.addTextContainer(textContainer)

            let location = gesture.location(in: contentLabel)
            let characterIndex = layoutManager.characterIndex(
                    for: location,
                    in: textContainer,
                    fractionOfDistanceBetweenInsertionPoints: nil)
            if
                characterIndex >= readMoreRange.location,
                characterIndex < readMoreRange.location + readMoreRange.length
            {
                contentLabel.attributedText = reviewAttributedText(reviewContent: reviewContent, shouldExpand: true)
            } else if
                characterIndex >= hideRange.location,
                characterIndex < hideRange.location + hideRange.length
            {
                contentLabel.attributedText = reviewAttributedText(
                    reviewContent: reviewContent,
                    shouldExpand: false)
            }
       }
    }
}

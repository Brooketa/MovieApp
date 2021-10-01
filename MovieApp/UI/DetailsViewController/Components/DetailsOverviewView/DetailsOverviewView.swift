import UIKit

class DetailsOverviewView: UIView {

    var overviewLabel: UILabel!
    var descriptionLabel: UILabel!

    var stackView: UIStackView!

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
        descriptionLabel.attributedText = lineSpacedDescription(description: "")
        stackView.addArrangedSubview(createHorizontalCrewRow(crewMembers: nil))
        stackView.addArrangedSubview(createHorizontalCrewRow(crewMembers: nil))
    }

    private func createHorizontalCrewRow(crewMembers: [MovieViewModel]?) -> UIStackView {
        let horizontalCrewRow = makeHorizontalCrewStackView()
        guard let crewMembers = crewMembers else { return UIStackView() }

        for crewMember in crewMembers {
            horizontalCrewRow.addArrangedSubview(createSignificantCrewViews(crewMember: crewMember))
        }

        return horizontalCrewRow
    }

    private func makeHorizontalCrewStackView() -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 15
        horizontalStackView.distribution = .equalCentering
        horizontalStackView.alignment = .fill

        return horizontalStackView
    }

    private func createSignificantCrewViews(crewMember: MovieViewModel?) -> SignificantCrewView {
        let crewMemberView = SignificantCrewView()
        crewMemberView.setCrewMember(name: "", role: "")

        return crewMemberView
    }

    private func lineSpacedDescription(description: String) -> NSMutableAttributedString {
        let descriptionAttString = NSMutableAttributedString(string: description)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6

        descriptionAttString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: descriptionAttString.length))

        return descriptionAttString
    }

}

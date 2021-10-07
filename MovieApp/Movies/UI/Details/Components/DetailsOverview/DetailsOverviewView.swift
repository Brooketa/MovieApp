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

    func set(viewModel: DetailsOverviewViewModel) {
        descriptionLabel.attributedText = lineSpacedDescription(description: viewModel.overview)
        stackView.addArrangedSubview(createHorizontalCrewRow(crewMembers: viewModel.firstRowCast))
        stackView.addArrangedSubview(createHorizontalCrewRow(crewMembers: viewModel.secondRowCast))
    }

    private func createHorizontalCrewRow(crewMembers: [OverviewCastViewModel]) -> UIStackView {
        let horizontalCrewRow = makeHorizontalCrewStackView()

        for crewMember in crewMembers {
            horizontalCrewRow.addArrangedSubview(createSignificantCrewViews(crewMember: crewMember))
        }

        return horizontalCrewRow
    }

    private func makeHorizontalCrewStackView() -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 15
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.alignment = .fill

        return horizontalStackView
    }

    private func createSignificantCrewViews(crewMember: OverviewCastViewModel) -> SignificantCrewView {
        let crewMemberView = SignificantCrewView()
        crewMemberView.setCrewMember(name: crewMember.castName, role: crewMember.castRole)

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

import UIKit
import SnapKit

extension DetailsReviewView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        socialLabel = UILabel()
        addSubview(socialLabel)

        authorView = DetailsReviewAuthorView()
        addSubview(authorView)

        contentLabel = UILabel()
        addSubview(contentLabel)
    }

    func styleViews() {
        socialLabel.text = LocalizableString.detailsSocialTitle.localized
        socialLabel.textColor = .darkBlue
        socialLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)

        contentLabel.textColor = .gray
        contentLabel.font = .systemFont(ofSize: 14)
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byTruncatingTail
        contentLabel.isUserInteractionEnabled = true
    }

    func defineLayoutForViews() {
        let inset = 16
        socialLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(inset)
            make.trailing.equalToSuperview().inset(inset)
        }

        authorView.snp.makeConstraints { make in
            make.top.equalTo(socialLabel.snp.bottom).offset(inset)
            make.leading.equalToSuperview().offset(inset)
            make.trailing.equalToSuperview().inset(inset)
            make.height.equalTo(80)
        }

        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(authorView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(inset)
            make.trailing.bottom.equalToSuperview().inset(inset)
        }
    }

}

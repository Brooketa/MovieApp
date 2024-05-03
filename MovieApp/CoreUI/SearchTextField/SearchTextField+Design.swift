import UIKit
import SnapKit

extension SearchTextField: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {}

    func styleViews() {
        placeholder = LocalizableString.searchPlaceholder.localized
        backgroundColor = UIColor(rgb: 0xEAEAEB)
        clearButtonMode = .whileEditing
        configureRoundedCorners()
        leftViewMode = .always
        leftView = makeLeftView()
    }

    func defineLayoutForViews() {}

    private func makeLeftView() -> UIImageView {
        let searchIconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let searchIconImage = UIImage(systemName: "magnifyingglass")
        searchIconImageView.image = searchIconImage
        searchIconImageView.tintColor = UIColor.darkBlue

        return searchIconImageView
    }

}

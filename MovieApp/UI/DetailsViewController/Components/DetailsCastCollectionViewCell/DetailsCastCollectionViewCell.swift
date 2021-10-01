import UIKit

class DetailsCastCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DetailsCastCollectionViewCell.self)

    var castImageView: UIImageView!
    var castNameLabel: UILabel!
    var castRoleLabel: UILabel!

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

    public func set(viewModel: MovieViewModel?) {
        castImageView.image = UIImage(named: "")
        castNameLabel.text = ""
        castRoleLabel.text = ""
    }

}

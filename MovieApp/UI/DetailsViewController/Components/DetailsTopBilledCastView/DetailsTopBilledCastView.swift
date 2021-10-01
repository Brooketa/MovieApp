import UIKit

class DetailsTopBilledCastView: UIView {

    private typealias CastDataSource = UICollectionViewDiffableDataSource<CastSection, MovieViewModel>
    private typealias CastSnapshot = NSDiffableDataSourceSnapshot<CastSection, MovieViewModel>

    var topBilledCastLabel: UILabel!
    var fullCastButton: UIButton!

    var collectionView: UICollectionView!

    private var castDataSource: CastDataSource!
    private var castSnapshot: CastSnapshot!

    init() {
        super.init(frame: .zero)

        buildViews()
        castDataSource = makeCastDataSource()

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

    public func setCast(viewModels: [MovieViewModel]) {
        updateCastDataSource(with: viewModels)
    }

    private func makeCastDataSource() -> CastDataSource {
        let castDataSource = CastDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, castViewModel in
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: DetailsCastCollectionViewCell.identifier,
                        for: indexPath) as? DetailsCastCollectionViewCell
                else {
                    return UICollectionViewCell()
                }

                cell.set(viewModel: castViewModel)

                return cell
            })

        castSnapshot = CastSnapshot()
        castSnapshot.appendSections([.main])

        return castDataSource
    }

    private func updateCastDataSource(with viewModels: [MovieViewModel]) {
        castSnapshot.appendItems(viewModels, toSection: .main)
        castDataSource.apply(castSnapshot, animatingDifferences: true, completion: nil)
    }

}

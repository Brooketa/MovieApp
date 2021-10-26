import Combine
import UIKit

class DetailsRecommendedView: UIView {

    private typealias RecommendedDataSource = UICollectionViewDiffableDataSource
    <RecommendedSection,
     RecommendedMovieViewModel>
    private typealias RecommendedSnapshot = NSDiffableDataSourceSnapshot<RecommendedSection, RecommendedMovieViewModel>

    var recommendationsLabel: UILabel!
    var collectionView: UICollectionView!

    var recommendedMovieTap = PassthroughSubject<Int, Never>()

    private var recommendedDataSource: RecommendedDataSource!
    private var recommendedSnapshot: RecommendedSnapshot!

    init() {
        super.init(frame: .zero)

        buildViews()
        collectionView.delegate = self

        recommendedDataSource = makeRecommendedDataSource()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
        collectionView.delegate = self

        recommendedDataSource = makeRecommendedDataSource()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        defineLayoutForViews()
    }

    func setRecommended(from viewModel: DetailsRecommendedViewModel) {
        updateRecommendedDataSource(with: viewModel.recommendedMovies)
    }

    private func makeRecommendedDataSource() -> RecommendedDataSource {
        let recommendedDataSource = RecommendedDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, recommendedViewModel in
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: DetailsRecommendedCollectionViewCell.identifier,
                        for: indexPath) as? DetailsRecommendedCollectionViewCell
                else {
                    return UICollectionViewCell()
                }

                cell.set(viewModel: recommendedViewModel)

                return cell
            })

        recommendedSnapshot = RecommendedSnapshot()
        recommendedSnapshot.appendSections([RecommendedSection.main])

        return recommendedDataSource
    }

    private func updateRecommendedDataSource(with viewModels: [RecommendedMovieViewModel]) {
        recommendedSnapshot.appendItems(viewModels, toSection: RecommendedSection.main)
        recommendedDataSource.apply(recommendedSnapshot, animatingDifferences: true, completion: nil)
    }

}

extension DetailsRecommendedView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = recommendedDataSource.itemIdentifier(for: indexPath) else { return }

        recommendedMovieTap.send(viewModel.movieID)
    }

}

import UIKit
import SnapKit

extension DetailsRecommendedView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        recommendationsLabel = UILabel()
        addSubview(recommendationsLabel)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.register(
            DetailsRecommendedCollectionViewCell.self,
            forCellWithReuseIdentifier: DetailsRecommendedCollectionViewCell.identifier)
        addSubview(collectionView)
    }

    func styleViews() {
        backgroundColor = .primaryBackground

        recommendationsLabel.text = LocalizableString.detailsRecommendationsTitle.localized
        recommendationsLabel.textColor = .primaryTitle
        recommendationsLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)

        collectionView.clipsToBounds = false
        collectionView.backgroundColor = .primaryBackground
    }

    func defineLayoutForViews() {
        recommendationsLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(recommendationsLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.58),
                heightDimension: .fractionalWidth(0.40)),
            subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)

        return UICollectionViewCompositionalLayout(section: section)
    }

}

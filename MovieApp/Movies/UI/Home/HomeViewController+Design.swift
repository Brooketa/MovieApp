import UIKit
import SwiftUI

extension HomeViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())

        collectionView.register(
            HomeSectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HomeSectionHeader.identifier)

        collectionView.register(
            MovieCollectionViewCell.self,
            forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)

        view.addSubview(collectionView)

    }

    func styleViews() {
        setDefaultNavBar()
        view.backgroundColor = .white

        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
    }

    func defineLayoutForViews() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(90))

        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)

        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.40),
                heightDimension: .fractionalWidth(0.55)),
            subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        section.boundarySupplementaryItems = [sectionHeader]

        return UICollectionViewCompositionalLayout(section: section)
    }
}

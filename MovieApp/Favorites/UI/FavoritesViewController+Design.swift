import UIKit
import SnapKit

extension FavoritesViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        favoritesLabel = UILabel()
        view.addSubview(favoritesLabel)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.register(
            MovieCollectionViewCell.self,
            forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        view.addSubview(collectionView)
    }

    func styleViews() {
        setDefaultNavBar()
        setDefaultBackButtonTitle()
        view.backgroundColor = .white

        favoritesLabel.text = "Favorites"
        favoritesLabel.textColor = UIColor.darkBlue
        favoritesLabel.font = .systemFont(ofSize: 20, weight: .bold)

        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
    }

    func defineLayoutForViews() {
        favoritesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(18)
            make.height.equalTo(30)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(favoritesLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.333),
                heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 10)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(0.55)),
            subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)

        return UICollectionViewCompositionalLayout(section: section)
    }

}

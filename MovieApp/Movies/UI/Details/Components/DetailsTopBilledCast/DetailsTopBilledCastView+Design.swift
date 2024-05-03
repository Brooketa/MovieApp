import UIKit
import SnapKit

extension DetailsTopBilledCastView: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        topBilledCastLabel = UILabel()
        addSubview(topBilledCastLabel)

        fullCastButton = UIButton()
        addSubview(fullCastButton)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.register(
            DetailsCastCollectionViewCell.self,
            forCellWithReuseIdentifier: DetailsCastCollectionViewCell.identifier)
        addSubview(collectionView)
    }

    func styleViews() {
        backgroundColor = .primaryBackground

        topBilledCastLabel.text = LocalizableString.detailsTopBilledCastTitle.localized
        topBilledCastLabel.textColor = .primaryTitle
        topBilledCastLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)

        fullCastButton.setTitle(LocalizableString.detailsFullCastAndCrewButtonTitle.localized, for: .normal)
        fullCastButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        fullCastButton.setTitleColor(.primaryTitle, for: .normal)
        fullCastButton.setTitleColor(.lightGray, for: .highlighted)
        fullCastButton.titleLabel?.textAlignment = .right

        collectionView.clipsToBounds = false
        collectionView.backgroundColor = .primaryBackground
    }

    func defineLayoutForViews() {
        topBilledCastLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
            make.trailing.equalTo(fullCastButton.snp.leading)
        }

        fullCastButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(topBilledCastLabel.snp.centerY)
            make.width.equalTo(140)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(topBilledCastLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.36),
                heightDimension: .fractionalWidth(0.58)),
            subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 20)

        return UICollectionViewCompositionalLayout(section: section)
    }

}

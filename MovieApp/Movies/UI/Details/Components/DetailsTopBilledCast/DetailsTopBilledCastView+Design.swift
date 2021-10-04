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
        addSubview(collectionView)
    }

    func styleViews() {
        topBilledCastLabel.text = "Top Billed Cast"
        topBilledCastLabel.textColor = .darkBlue
        topBilledCastLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)

        fullCastButton.setTitle("Full Cast & Crew", for: .normal)
        fullCastButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        fullCastButton.setTitleColor(.darkBlue, for: .normal)
        fullCastButton.setTitleColor(.lightGray, for: .highlighted)
    }

    func defineLayoutForViews() {
        topBilledCastLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.equalTo(fullCastButton.snp.leading)
        }

        fullCastButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(topBilledCastLabel.snp.centerY)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(topBilledCastLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview().inset(20)
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
                widthDimension: .fractionalWidth(0.40),
                heightDimension: .fractionalWidth(0.55)),
            subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15)

        return UICollectionViewCompositionalLayout(section: section)
    }

}

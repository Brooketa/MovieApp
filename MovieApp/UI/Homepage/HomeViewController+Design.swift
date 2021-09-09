import UIKit
import SnapKit

extension HomeViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            MovieCollectionViewCell.self,
            forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)

        view.addSubview(collectionView)
    }

    func styleViews() {
        setDefaultNavBar()
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
    }

    func defineLayoutForViews() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
        }
    }

    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width * 0.9, height: 140)
       return layout
    }

}

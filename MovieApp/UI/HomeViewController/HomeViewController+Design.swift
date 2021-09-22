import UIKit

extension HomeViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        sectionHeader = HomeSectionHeader()
        view.addSubview(sectionHeader)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())

        collectionView.register(
            HomeSectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HomeSectionHeader.identifier)

        collectionView.register(
            HomeCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)

        view.addSubview(collectionView)

    }

    func styleViews() {
        setDefaultNavBar()
        view.backgroundColor = .white

        collectionView.contentInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white

        sectionHeader.setTitle(sectionTitle: "What's popular")
        sectionHeader.setSubcategories(
            subcategories: [.action, .adventure, .comedy, .documentary, .drama, .horror, .scienceFiction, .thriller])
    }

    func defineLayoutForViews() {
        sectionHeader.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(100)
        }

        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(sectionHeader.snp.bottom)
            make.height.equalTo(400)
        }
    }

    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width * 0.3, height: 170)
        layout.scrollDirection = .horizontal

       return layout
    }

}

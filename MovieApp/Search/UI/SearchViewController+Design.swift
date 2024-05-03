import UIKit
import SnapKit

extension SearchViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        cancelButton = UIButton()
        view.addSubview(cancelButton)

        searchTextField = SearchTextField()
        view.addSubview(searchTextField)

        dismissKeyboardView = UIView()
        view.addSubview(dismissKeyboardView)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.register(
            SearchCollectionViewCell.self,
            forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        view.addSubview(collectionView)
    }

    func styleViews() {
        setDefaultNavBar()
        setDefaultBackButtonTitle()
        navigationItem.hidesBackButton = true

        view.backgroundColor = .primaryBackground

        cancelButton.setTitle(LocalizableString.cancel.localized, for: .normal)
        cancelButton.setTitleColor(.primaryTitle, for: .normal)
        cancelButton.setTitleColor(UIColor.lightGray, for: .highlighted)
        cancelButton.alpha = 0.0

        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .primaryBackground
        collectionView.showsVerticalScrollIndicator = false
    }

    func defineLayoutForViews() {
        cancelButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(15)
            make.centerY.equalTo(searchTextField.snp.centerY)
            make.height.equalTo(20)
            make.width.equalTo(60)
        }

        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(45)
        }

        dismissKeyboardView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(15)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width * 0.9, height: 140)

       return layout
    }

}

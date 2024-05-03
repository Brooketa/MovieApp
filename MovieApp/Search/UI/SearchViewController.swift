import Combine
import UIKit
import SnapKit

class SearchViewController: UIViewController {

    private typealias SearchDataSource = UICollectionViewDiffableDataSource<SearchSection, SearchMovieViewModel>
    private typealias SearchSnapshot = NSDiffableDataSourceSnapshot<SearchSection, SearchMovieViewModel>

    var cancelButton: UIButton!
    var searchTextField: SearchTextField!
    var dismissKeyboardView: UIView!
    var collectionView: UICollectionView!

    private var searchPresenter: SearchPresenter!
    private var searchDataSource: SearchDataSource!

    private var cancellables = Set<AnyCancellable>()

    init(presenter: SearchPresenter) {
        searchPresenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        collectionView.delegate = self

        searchDataSource = makeSearchDataSource()

        configureKeyboardDismissTap()
        configureCancelButtonSubscription()
        configureTextFieldSubscription()

        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            self.searchTextField.becomeFirstResponder()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        UIView.setAnimationsEnabled(true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        UIView.setAnimationsEnabled(false)
    }

    private func configureKeyboardDismissTap() {
        dismissKeyboardView
            .tap
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }

                self.searchTextField.resignFirstResponder()
            })
            .store(in: &cancellables)
    }

    private func configureCancelButtonSubscription() {
        cancelButton
            .tap
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }

                self.animateTextField(didBeginEditing: false)
            })
            .store(in: &cancellables)
    }

    private func configureTextFieldSubscription() {
        NotificationCenter
            .default
            .publisher(for: UITextField.textDidChangeNotification, object: searchTextField)
            .map { ($0.object as? UITextField)?.text ?? "" }
            .debounce(for: 0.5, scheduler: RunLoop.main, options: nil)
            .removeDuplicates()
            .flatMap { [weak self] text -> AnyPublisher<[SearchMovieViewModel], Never> in
                guard let self = self else { return Empty<[SearchMovieViewModel], Never>().eraseToAnyPublisher() }

                return self.searchPresenter
                    .searchMovies(query: text.replacingOccurrences(of: " ", with: "%20"))
            }
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] searchedMovies in
                guard let self = self else { return }

                self.updateSearchDataSource(with: searchedMovies)
            })
            .store(in: &cancellables)

        NotificationCenter
            .default
            .publisher(for: UITextField.textDidBeginEditingNotification, object: searchTextField)
            .sink(receiveValue: { [weak self] _ in
                guard let self = self else { return }

                self.animateTextField(didBeginEditing: true)
            })
            .store(in: &cancellables)
    }

    private func makeSearchDataSource() -> SearchDataSource {
        SearchDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, searchMovieViewModel in
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: SearchCollectionViewCell.identifier,
                        for: indexPath) as? SearchCollectionViewCell
                else {
                    return UICollectionViewCell()
                }

                cell.set(viewModel: searchMovieViewModel)

                return cell
            })
    }

    private func updateSearchDataSource(with viewModels: [SearchMovieViewModel]) {
        var searchSnapshot = SearchSnapshot()
        searchSnapshot.appendSections([SearchSection.main])
        searchSnapshot.appendItems(viewModels)

        searchDataSource.apply(searchSnapshot, animatingDifferences: true, completion: nil)
    }

    private func animateTextField(didBeginEditing: Bool) {
        if didBeginEditing {
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let self = self else { return }

                self.searchTextField.snp.updateConstraints { make in
                    make.trailing.equalToSuperview().inset(85)
                }
                self.cancelButton.alpha = 1.0
                self.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(
                withDuration: 0.2,
                animations: { [weak self] in
                    guard let self = self else { return }

                    self.searchTextField.snp.updateConstraints { make in
                        make.trailing.equalToSuperview().inset(15)
                    }
                    self.cancelButton.alpha = 0.0
                    self.view.layoutIfNeeded()
                },
                completion: { [weak self] _ in
                    guard
                        let self = self,
                        let navigationController = self.navigationController
                    else {
                        return
                    }

                    navigationController.popViewController(animated: false)
                })
        }
    }

}

extension SearchViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        searchTextField.resignFirstResponder()
        guard let viewModel = searchDataSource.itemIdentifier(for: indexPath) else { return }

        searchPresenter.showDetails(movieID: viewModel.movieID)
    }

}

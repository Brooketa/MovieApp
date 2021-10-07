import Combine
import UIKit

class DetailsViewController: UIViewController {

    private var detailsPresenter: DetailsPresenter!

    private var cancellables = Set<AnyCancellable>()

    init(presenter: DetailsPresenter) {
        detailsPresenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }

}

import UIKit

import RxSwift
import RxCocoa

class DetailViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("This is Detail", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    let disposeBag = DisposeBag()

    var viewModel: DetailViewModel!
    weak var router: DetailRouting?

    init(viewModel: DetailViewModel, router: DetailRouting?) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setupRx()
    }

    private func setUI() {
        view.backgroundColor = .blue
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: button.topAnchor),
            view.bottomAnchor.constraint(equalTo: button.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: button.trailingAnchor),
        ])
    }

    private func setupRx(){
        button.rx.tapGesture()
            .when(.recognized)
            .map { _ in "Close Passing Value" }
            .subscribe(onNext: { [weak self] value in
                guard let self = self else { return }
                self.closeDetailViewController(passingValue: value)
            })
            .disposed(by: disposeBag)
    }

    func closeDetailViewController(passingValue: String) {
        router?.closeDetailViewController(passingValue: passingValue)
    }
}

extension DetailViewController: UIViewControllerTransitioningDelegate {

    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        closeDetailViewController(passingValue: "")
        return nil
    }
}

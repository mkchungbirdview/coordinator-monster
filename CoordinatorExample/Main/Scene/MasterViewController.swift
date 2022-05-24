import UIKit

import RxSwift
import RxCocoa
import RxGesture

protocol MasterViewControllerDelegate: AnyObject {
    func makeSomeViewModel(data: String) -> SomeViewModel
}

class MasterViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("This is Detail", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let disposeBag = DisposeBag()

    lazy var someView: SomeView = {
        let someView = SomeView()
        return someView
    }()
    
    var viewModel: MasterViewModel
    weak var router: MasterRouting?
    weak var delegate: MasterViewControllerDelegate?

    init(viewModel: MasterViewModel, router: MasterRouting?) {
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

        view.backgroundColor = .white
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: button.topAnchor),
            view.bottomAnchor.constraint(equalTo: button.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: button.trailingAnchor),
        ])
        button.setTitle("HELLO", for: .normal)

        view.addSubview(someView)
        someView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            someView.widthAnchor.constraint(equalToConstant: 300),
            someView.heightAnchor.constraint(equalToConstant: 300),
            someView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            someView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        setupSomeView()

    }

    private func setupRx() {
        button.rx.tapGesture()
            .when(.recognized)
            .compactMap { [weak self] _ in
                self?.viewModel.id
            }
            .subscribe(onNext: { [weak self] id in
                guard let self = self else { return }
                self.router?.pushDetail(id: id)
            })
            .disposed(by: disposeBag)
    }

    func popBackFromOtherScene(passingValue: String) {
        print("\(passingValue) is passed by Detail")
    }

    func setupSomeView() {
        let someString = "Hi"

        if let someViewModel = delegate?.makeSomeViewModel(data: someString) {
            someView.configure(viewModel: someViewModel)
        }
    }
}


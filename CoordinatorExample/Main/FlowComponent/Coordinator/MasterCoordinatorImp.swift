import UIKit
import Common

class MasterCoordinatorImp: MasterCoordinatorable {
    let navigationController: UINavigationController
    let dependenciesFactory: MasterDependenciesFactory
    let detailDependenciesFactory: DetailDependenciesFactory

    weak var masterViewController: MasterViewController?
    weak var detailViewController: DetailViewController?

    //
    init(
        navigationController: UINavigationController,
        dependenciesFactory: MasterDependenciesFactory,
        detailDependenciesFactory: DetailDependenciesFactory
    ) {
        self.navigationController = navigationController
        self.dependenciesFactory = dependenciesFactory
        self.detailDependenciesFactory = detailDependenciesFactory
    }
    
    func start() {
        let viewContrller = dependenciesFactory
            .makeMasterViewController(router: self)
        masterViewController = viewContrller
        masterViewController?.delegate = self

        navigationController.viewControllers = [viewContrller]
    }
}

extension MasterCoordinatorImp: MasterRouting {
    func pushDetail(id: String) {
        let vm = detailDependenciesFactory.makeDetailViewModel()
        let vc = detailDependenciesFactory
            .makeDetailViewController(viewModel: vm, router: self)
        detailViewController = vc
        openScene(type: .push, to: vc, animated: true)
    }

    func popDetail(passingValue: String) {
        masterViewController?.popBackFromOtherScene(passingValue: passingValue)
    }
}

extension MasterCoordinatorImp: DetailRouting {
    func closeDetailViewController(passingValue: String) {
        if let detailViewController = detailViewController {
            closeScene(type: .pop, to: detailViewController, animated: true) { [weak self] in
                self?.popDetail(passingValue: passingValue)
            }
        }
    }
}

extension MasterCoordinatorImp: MasterViewControllerDelegate {
    func makeSomeViewModel(data: String) -> SomeViewModel {
        return dependenciesFactory.makeSomeViewModel(someData: data)
    }
}

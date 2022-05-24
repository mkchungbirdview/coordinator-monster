import UIKit
import Common

protocol MasterCoordinatorable: Coordinatorable {
    var navigationController: UINavigationController { get }
    var dependenciesFactory: MasterDependenciesFactory { get }
    var detailDependenciesFactory: DetailDependenciesFactory { get }
}

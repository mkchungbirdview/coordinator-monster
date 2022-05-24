import Foundation
import Common 
protocol MasterDependenciesFactory: DependenciesFactory {

    var viewModel: MasterViewModel { get }

    func makeMasterViewController(
//        viewModel: MasterViewModel,
        router: MasterRouting?
    ) -> MasterViewController

    func makeMasterViewModel(myAPI: MyAPI) -> MasterViewModel
    func makeSomeViewModel(someData: String) -> SomeViewModel
}

protocol ReactiveViewModel {

}

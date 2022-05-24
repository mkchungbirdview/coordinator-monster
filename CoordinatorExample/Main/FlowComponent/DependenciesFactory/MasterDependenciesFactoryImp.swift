import Foundation
import RxSwift

class MyAPI {}

class MasterDependenciesFactoryImp: MasterDependenciesFactory {

    var viewModel: MasterViewModel {
        return makeMasterViewModel(myAPI: myAPI)
    }

    let disposeBag = DisposeBag()
    let myAPI: MyAPI
    init(myAPI: MyAPI) {
        self.myAPI = myAPI
    }

    func makeMasterViewController(
        router: MasterRouting?
    ) -> MasterViewController {
        return MasterViewController(viewModel: viewModel, router: router)
    }

    func makeMasterViewModel(myAPI: MyAPI) -> MasterViewModel {
        return MasterViewModel(myAPI: myAPI)
    }

    func makeSomeViewModel(someData: String) -> SomeViewModel {
        let someViewModel = SomeViewModel(someData: someData)
        someViewModel.output.viewTitle
            .bind(to: viewModel.output.result)
            .disposed(by: disposeBag)

        return someViewModel
    }
}

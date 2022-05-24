import Foundation

import RxSwift
import RxCocoa

class MasterViewModel: ReactiveViewModel {

    var id: String = ""
    let myAPI: MyAPI

    init(myAPI: MyAPI = .init()) {
        self.myAPI = myAPI
    }
    
    let detail = PublishSubject<Void>()

    let input = Input()
    let output = Output()

    struct Input {
        let source = PublishSubject<String>()
    }
    struct Output {
        let result = PublishSubject<String>()
    }
}

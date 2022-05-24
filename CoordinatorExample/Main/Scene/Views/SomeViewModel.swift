//
//  SomeViewModel.swift
//  CoordinatorExample
//
//  Created by Minki Chung on 2022/05/24.
//  Copyright © 2022 William Pompei. All rights reserved.
//

import Foundation
import RxSwift

class SomeViewModel: ReactiveViewModel {
    let input = Input()
    let output = Output()

    struct Input {
        let source = PublishSubject<String>()
    }
    struct Output {
        let viewTitle = PublishSubject<String>()
    }

    let someData: String

    init(someData: String) {
        self.someData = someData
    }
}

//
//  DetailDependenciesFactoryImp.swift
//  CoordinatorExample
//
//  Created by Minki Chung on 2022/05/20.
//  Copyright © 2022 William Pompei. All rights reserved.
//

import Foundation

class DetailDependenciesFactoryImp: DetailDependenciesFactory {

    func makeDetailViewController(viewModel: DetailViewModel, router: DetailRouting?) -> DetailViewController {
        return DetailViewController(viewModel: viewModel, router: router)
    }

    func makeDetailViewModel() -> DetailViewModel {
        return DetailViewModel()
    }


}

//
//  DetailDependenciesFactory.swift
//  CoordinatorExample
//
//  Created by Minki Chung on 2022/05/20.
//  Copyright © 2022 William Pompei. All rights reserved.
//

import Common

protocol DetailDependenciesFactory: DependenciesFactory {

    func makeDetailViewController(
        viewModel: DetailViewModel,
        router: DetailRouting?
    ) -> DetailViewController

    func makeDetailViewModel() -> DetailViewModel
}

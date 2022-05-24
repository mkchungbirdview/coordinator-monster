//
//  DetailCoordinatorImp.swift
//  CoordinatorExample
//
//  Created by Minki Chung on 2022/05/20.
//  Copyright © 2022 William Pompei. All rights reserved.
//

import UIKit

class DetailCoordinatorImp: DetailCoordinatorable {
    var navigationController: UINavigationController
    var detailDependenciesFactory: DetailDependenciesFactory

    init(
        navigationController: UINavigationController,
        detailDependenciesFactory: DetailDependenciesFactory
    ) {
        self.navigationController = navigationController
        self.detailDependenciesFactory = detailDependenciesFactory
    }

    func start() {

    }
}

extension DetailCoordinatorImp: DetailRouting {
    var dependenciesFactory: DetailDependenciesFactory {
        detailDependenciesFactory
    }

    func closeDetailViewController(passingValue: String) {
//        navigationController.popViewController(animated: true)
    }
}

//
//  AppRootCoordinator.swift
//  CoordinatorExample
//
//  Created by Minki Chung on 2022/05/23.
//  Copyright © 2022 William Pompei. All rights reserved.
//

import Foundation
import UIKit

import Common

class AppRootCoordinator: Coordinatorable {
    var navigationController: UINavigationController

    var coordinator: MasterCoordinatorable?

    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }

    func start() {
        let detailDependenciesFactory = DetailDependenciesFactoryImp()

        let masterDependenciesFactory = MasterDependenciesFactoryImp(myAPI: MyAPI())
        coordinator = MasterCoordinatorImp(
            navigationController: navigationController,
            dependenciesFactory: masterDependenciesFactory,
            detailDependenciesFactory: detailDependenciesFactory
        )
        coordinator?.start()
    }
}

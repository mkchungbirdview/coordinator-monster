//
//  DetailCoordinatorable.swift
//  CoordinatorExample
//
//  Created by Minki Chung on 2022/05/20.
//  Copyright © 2022 William Pompei. All rights reserved.
//

import UIKit

import Common

protocol DetailCoordinatorable: Coordinatorable {
    var navigationController: UINavigationController { get }
    var detailDependenciesFactory: DetailDependenciesFactory { get }
}

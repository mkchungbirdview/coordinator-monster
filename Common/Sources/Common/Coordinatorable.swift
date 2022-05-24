//
//  Coordinatorable.swift
//  CoordinatorExample
//
//  Created by Minki Chung on 2022/05/19.
//  Copyright © 2022 William Pompei. All rights reserved.
//

import UIKit

public protocol Coordinatorable {
    var navigationController: UINavigationController { get }

    func start()
}

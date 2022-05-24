//
//  DetailRouting.swift
//  CoordinatorExample
//
//  Created by Minki Chung on 2022/05/20.
//  Copyright © 2022 William Pompei. All rights reserved.
//

import Foundation
import Common

protocol DetailRouting: Flowable {
    func closeDetailViewController(passingValue: String)
}

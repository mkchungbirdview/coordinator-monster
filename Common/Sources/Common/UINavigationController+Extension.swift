//
//  UINavigationController+Extension.swift
//  
//
//  Created by Minki Chung on 2022/05/23.
//

import UIKit

extension UINavigationController {
    func popViewController(
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        popViewController(animated: animated)
        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async { completion?() }
            return
        }
        coordinator.animate(alongsideTransition: nil) { _ in completion?() }
    }
}

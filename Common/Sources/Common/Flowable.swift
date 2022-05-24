//
//  Flowable.swift
//  CoordinatorExample
//
//  Created by Minki Chung on 2022/05/20.
//  Copyright © 2022 William Pompei. All rights reserved.
//

import UIKit

public protocol Flowable: AnyObject {

    var navigationController: UINavigationController { get }

    // Flowable 프로토콜을 따른다면 반드시 다음 화면에 대한 DependenciesFactory를 구현해줘야합니다.
}

extension Flowable {
    public func openScene<VC: UIViewController>(
        type: SceneOpenType,
        to viewController: VC,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        switch type {
        case .present:
            navigationController.present(
                viewController,
                animated: animated
            )
        case .push:
            navigationController.pushViewController(
                viewController,
                animated: animated
            )
        case .custom:
            break
        }
    }

    public func closeScene<VC: UIViewController>(
        type: SceneCloseType,
        to viewController: VC,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        switch type {
        case .dismiss:
            navigationController
                .viewControllers
                .filter { $0 == viewController }
                .last?
                .dismiss(
                    animated: animated,
                    completion: completion
                )
        case .pop:
            navigationController
                .popViewController(animated: animated, completion: completion)
        case .custom:
            break
        }
    }
}

public class Flow<DependencyType>: Flowable {
    public var navigationController: UINavigationController
    public let dependencies: DependencyType

    public init(navigationController: UINavigationController, dependencies: DependencyType) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
}

public enum SceneOpenType {
    case push
    case present
    case custom
}

public enum SceneCloseType {
    case pop
    case dismiss
    case custom
}

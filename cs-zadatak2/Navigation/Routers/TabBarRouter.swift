//
//  TabBarRouter.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 16.09.2022..
//

import Foundation
import UIKit

public protocol TabBarRouterAlias{
    typealias completion = (() -> Void)?
}

public class TabBarRouter: NSObject, TabBarRouterAlias{
    
    private let navigationController: UINavigationController
    private let routerRootController: UIViewController?
    private var onDismissForViewController: [UIViewController: completion] = [:]
    
    public init(navigationController: UINavigationController){
        self.navigationController = navigationController
        self.routerRootController = TabBarController()
        super.init()
        navigationController.delegate = self
    }
}

extension TabBarRouter: Router{
    // TODO: !!!!!!!!!!!!!
//    public func presentCoordinators(){
//        for coordinator in presentCoordinators(){
//            routerRootController.controllers = coordinator.navigationController
//        } 
//    }
    
    public func push(_ viewController: UIViewController, animated: Bool, onDismissed: completion) {
        onDismissForViewController[viewController] = onDismissed
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    public func dismiss(animated: Bool) {
        guard let routerRootController = routerRootController else{
            navigationController.popToRootViewController(animated: animated)
            return
        }
        performOnDismissed(for: routerRootController)
        navigationController.popToViewController(routerRootController, animated: animated)
    }
    
    private func performOnDismissed(for viewController: UIViewController){
        guard let onDismiss = onDismissForViewController[viewController] else { return }
        onDismiss?()
        onDismissForViewController[viewController] = nil
    }
}

extension TabBarRouter: UINavigationControllerDelegate{
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(dismissedViewController) else { return }
        performOnDismissed(for: dismissedViewController)
    }
}

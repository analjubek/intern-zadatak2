//
//  ModalNavigationRouter.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import Foundation
import UIKit

public protocol ModalNavigationRouterAlias{
    typealias completion = (() -> Void)?
}

public class ModalNavigationRouter: NSObject, ModalNavigationRouterAlias{
    
    public unowned let parentViewController: UIViewController
    
    private let navigationController = UINavigationController()
    private var onDismissForViewController: [UIViewController : completion] = [:]
    
    public init (parentViewController: UIViewController){
        self.parentViewController = parentViewController
        super.init()
        navigationController.delegate = self
    }
    
    deinit{
        print("Deinito sam se:", self)
    }
}

extension ModalNavigationRouter: Router{
    
    public func push(_ viewController: UIViewController, animated: Bool, onDismissed: completion) {
        onDismissForViewController[viewController] = onDismissed
        if navigationController.viewControllers.count == 0{
            presentModally(viewController, animated: animated)
        }
        else{
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    public func dismiss(animated: Bool) {
        performOnDismissed(for: navigationController.viewControllers.first!)
        parentViewController.dismiss(animated: animated, completion: nil)
    }
    
    private func presentModally(_ viewController: UIViewController, animated: Bool) {
        addCancelButton(to: viewController)
        navigationController.setViewControllers([viewController], animated: false)
//        navigationController.pushViewController(viewController, animated: animated)
        parentViewController.present(navigationController, animated: animated, completion: nil)
    }
    
    private func performOnDismissed(for viewController: UIViewController){
        guard let onDismiss = onDismissForViewController[viewController] else { return }
        onDismiss?()
        onDismissForViewController[viewController] = nil
    }
    
    private func addCancelButton(to viewController: UIViewController) {
      viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Natrag", style: .plain, target: self, action: #selector(cancelPressed))
    }
    
    @objc private func cancelPressed() {
      performOnDismissed(for: navigationController.viewControllers.first!)
      dismiss(animated: true)
    }
}

extension ModalNavigationRouter: UINavigationControllerDelegate{
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let dismissedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(dismissedViewController) else { return }
        performOnDismissed(for: dismissedViewController)
    }
}

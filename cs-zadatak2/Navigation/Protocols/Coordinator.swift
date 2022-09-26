//
//  Coordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import Foundation
import UIKit

public protocol CoordinatorAlias{
    typealias completion = (() -> Void)?
}

public protocol Coordinator: AnyObject, CoordinatorAlias{
    
    var childCoordinators: [Coordinator] { get set }
    var router: Router { get }
    
    func push(animated: Bool, onDismissed: completion)
    
    func pushChild(_ child: Coordinator, animated: Bool, onDismissed: completion)
    
    func dismiss(animated: Bool)
    
    func pushControllers(viewControllers: [UIViewController])
    
}

extension Coordinator{
    
    //MARK: - Public
    
    public func dismiss(animated: Bool){
        router.dismiss(animated: animated)
    }
    
    public func pushChild(_ child: Coordinator, animated: Bool, onDismissed: completion){
        childCoordinators.append(child)
        child.push(animated: animated) { [weak self, weak child] in
            guard let self = self, let child = child else { return }
            self.removeChild(child)
            onDismissed?()
        }
    }
    
    public func pushControllers(viewControllers: [UIViewController]){
        router.pushControllers(viewControllers)
    }
    
    //MARK: - Private
    
    private func removeChild(_ child: Coordinator){
        guard let index = childCoordinators.firstIndex(where: { coordinator in coordinator === child }) else { return }
        childCoordinators.remove(at: index)
    }
}

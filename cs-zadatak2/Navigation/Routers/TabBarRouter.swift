//
//  TabBarRouter.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 16.09.2022..
//

import Foundation
import UIKit


public class TabBarRouter: Router{
    
    public var tabBarController: TabBarController
    
    public init(tabBarController: TabBarController){
        self.tabBarController = tabBarController
    }

    public func pushControllers(_ viewControllers: [UIViewController]){
        tabBarController.viewControllers = viewControllers
        
    }
    
    public func push(_ viewController: UIViewController, animated: Bool, onDismissed: completion) {

    }
    
    public func dismiss(animated: Bool) {

    }
    
    private func performOnDismissed(for viewController: UIViewController){
        
    }
}

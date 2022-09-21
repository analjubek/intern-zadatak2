//
//  TabBarCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import Foundation
import UIKit

public class TabBarCoordinator: NSObject, Coordinator{
    
    public var childCoordinators: [Coordinator] = [HomeCoordinator(router: NavigationRouter(navigationController: UINavigationController())),
                                                   SettingsCoordinator(router: NavigationRouter(navigationController: UINavigationController())),
                                                   ContactCoordinator(router: NavigationRouter(navigationController: UINavigationController())),
                                                   SearchCoordinator(router: NavigationRouter(navigationController: UINavigationController()))]
    public var router: Router
    private lazy var tabBarController: TabBarController = TabBarController()
    private lazy var tabBarRouter = TabBarRouter(tabBarController: tabBarController)

    public init(router: Router){
        self.router = router
    }
    
    public func push(animated: Bool, onDismissed: completion) {
        router.push(tabBarController, animated: animated)
        tabBarRouter.pushControllers(childCoordinators.navigationControllers)
    }
}

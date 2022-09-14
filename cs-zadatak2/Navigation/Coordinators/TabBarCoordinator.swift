//
//  TabBarCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import Foundation
import UIKit

public class TabBarCoordinator: Coordinator{
    
    public var childCoordinators: [Coordinator] = []
    public let router: Router
    
    //let coordinator = TabBarCoordinator(router: ModalNavigationRouter(parentViewController: HomeViewController()))

    private lazy var tabBarController: TabBarController = {
        let vc = TabBarController.fromNib(bundle: Bundle.main)
        vc.title = "TabBarController"
        //vc.delegate = self
        return vc
    }()
    
    public init(router: Router){
        self.router = router
        //presentChild(coordinator, animated: true) { print("fucn tou") }
    }
    
    public func push(animated: Bool, onDismissed: completion) {
        router.push(tabBarController, animated: true, onDismissed: onDismissed)
    }
}
//extension TabBarCoordinator: TabBarCoordinator, UITabBarControllerDelegate{
//    override func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        <#code#>
//    }
//}

//extension TabBarCoordinator: UITabBarControllerDelegate{
//    func viewController(didRequestProceed vc: UIViewController) {
//        let router = ModalNavigationRouter(parentViewController: vc)
//        let coordinator = TabBarCoordinator(router: router)
//        //coordinator.delegate = self
//        presentChild(coordinator, animated: true) { print("fucn tou") }
//    }
//}

extension TabBarCoordinator: HomeCoordinatorDelegate{
    func coordinator(didRequestWebView coordinator: Coordinator, router: Router) {
        let coordinator = NewsWebViewCoordinator(router: router)
        coordinator.delegate = self
        presentChild(coordinator, animated: true){
            print("presentChild", coordinator)
        }
    }
}

extension TabBarCoordinator: NewsWebViewCoordinatorDelegate{
    func coordinator(didRequestFinish coordinator: Coordinator, router: Router) {
        
    }
}

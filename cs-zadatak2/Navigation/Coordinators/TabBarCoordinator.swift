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
    
    private lazy var tabBarController: TabBarController = {
        let vc = TabBarController.fromNib(bundle: Bundle.main)
        vc.title = "HomeViewController"
        //vc.delegate = self
        return vc
    }()
    
    public init(router: Router){
        self.router = router
    }
    
    public func push(animated: Bool, onDismissed: completion) {
        router.push(tabBarController, animated: true, onDismissed: onDismissed)
    }
}

extension TabBarCoordinator: TabBarControllerDelegate{
    func viewController(didRequestProceed vc: UIViewController) {
        let router = ModalNavigationRouter(parentViewController: vc)
        //let coordinator = AppointmentCoordinator(router: router)
        //coordinator.delegate = self
        //presentChild(coordinator, animated: true) { print("fucn tou") }
    }
}

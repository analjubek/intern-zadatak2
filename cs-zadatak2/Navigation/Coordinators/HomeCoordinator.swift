//
//  HomeCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import Foundation
import UIKit

public class HomeCoordinator: Coordinator{
    
    public var childCoordinators: [Coordinator] = []
    public let router: Router
    
    private lazy var homeViewController: HomeViewController = {
        let vc = HomeViewController.fromNib(bundle: Bundle.main)
        vc.title = "HomeViewController"
        vc.delegate = self
        return vc
    }()
    
    public init(router: Router){
        self.router = router
    }
    
    public func push(animated: Bool, onDismissed: completion) {
        router.push(homeViewController, animated: true, onDismissed: onDismissed)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate{
    func viewController(didRequestProceed vc: UIViewController) {
        let router = ModalNavigationRouter(parentViewController: vc)
        //let coordinator = AppointmentCoordinator(router: router)
        //coordinator.delegate = self
        //presentChild(coordinator, animated: true) { print("fucn tou") }
    }
}

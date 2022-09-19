//
//  SettingsCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 13.09.2022..
//

import UIKit
import Foundation

//protocol SettingsCoordinatorDelegate: AnyObject{
//    func coordinator(didRequestSummary coordinator: Coordinator, router: Router)
//}

public class SettingsCoordinator: Coordinator{
    public var childCoordinators: [Coordinator] = []
    public let router: Router
    //weak var delegate: SettingsCoordinatorDelegate?

    private lazy var settingsViewController: SettingsViewController = {
        let vc = SettingsViewController.fromNib(bundle: Bundle.main)
        vc.title = "SettingsViewController"
        vc.delegate = self
        
        return vc
    }()

    public init(router: Router){
        self.router = router
    }
//    public init(navigationController: UINavigationController){
//        self.navigationController = navigationController
//    }
    
    deinit{
        print("Deinited:", self)
    }

    public func push(animated: Bool, onDismissed: completion) {
        router.push(settingsViewController, animated: true, onDismissed: onDismissed)
    }
}

extension SettingsCoordinator: SettingsViewControllerDelegate{
    func viewController(didRequestOtherApps vc: UIViewController) {
        let navigationController = UINavigationController()
        let router = NavigationRouter(navigationController: navigationController)
        //let router = NavigationRouter(navigationController: self.settingsViewController.navigationController)
        //NavigationRouter(parentViewController: vc)
        let coordinator = OtherAppsCoordinator(router: router)
        coordinator.delegate = self
        presentChild(coordinator, animated: true) { print("fucn tou") }
    }
}

extension SettingsCoordinator: OtherAppsCoordinatorDelegate{
    func coordinator(didRequestFinish coordinator: Coordinator, router: Router) {
        
    }
}

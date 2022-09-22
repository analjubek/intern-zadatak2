//
//  SettingsCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 13.09.2022..
//

import UIKit
import Foundation

public class SettingsCoordinator: Coordinator{
    public var childCoordinators: [Coordinator] = []
    public let router: Router

    private lazy var settingsViewController: SettingsViewController = {
        let vc = SettingsViewController.fromNib(bundle: Bundle.main)
        vc.title = "Postavke"
        vc.tabBarItem.image = UIImage(systemName: "gearshape")
        vc.delegate = self
        
        return vc
    }()

    public init(router: Router){
        self.router = router
    }
    
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
        let coordinator = OtherAppsCoordinator(router: router)
        coordinator.delegate = self
        pushChild(coordinator, animated: true) { print("fucn tou") }
    }
}

extension SettingsCoordinator: OtherAppsCoordinatorDelegate{
    func coordinator(didRequestFinish coordinator: Coordinator, router: Router) {
        
    }
}

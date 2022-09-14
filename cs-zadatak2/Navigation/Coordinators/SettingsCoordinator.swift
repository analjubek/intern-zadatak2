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
//    weak var delegate: SettingsCoordinatorDelegate?

    private lazy var settingsViewController: SettingsViewController = {
        let vc = SettingsViewController.fromNib(bundle: Bundle.main)
        vc.title = "SettingsViewController"
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
    func viewController(didRequestProceed vc: UIViewController) {
//        self.delegate?.coordinator(didRequestSummary: self, router: router)
    }
}


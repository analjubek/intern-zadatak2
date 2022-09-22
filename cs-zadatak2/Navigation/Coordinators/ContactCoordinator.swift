//
//  ContactCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 13.09.2022..
//

import UIKit
import Foundation

public class ContactCoordinator: Coordinator{

    public var childCoordinators: [Coordinator] = []
    public let router: Router

    private lazy var contactViewController: ContactViewController = {
        let vc = ContactViewController.fromNib(bundle: Bundle.main)
        vc.title = "Kontakt"
        vc.tabBarItem.image = UIImage(systemName: "phone")
        return vc
    }()

    public init(router: Router){
        self.router = router
    }
    
    deinit{
        print("Deinited:", self)
    }

    public func push(animated: Bool, onDismissed: completion) {
        router.push(contactViewController, animated: true, onDismissed: onDismissed)
    }
}

extension ContactCoordinator: ContactViewControllerDelegate{
    public func viewController(didRequestProceed vc: UIViewController) {
        
    }
}


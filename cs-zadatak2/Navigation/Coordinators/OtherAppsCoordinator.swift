//
//  OtherAppsCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 16.09.2022..
//


import UIKit
import Foundation

protocol OtherAppsCoordinatorDelegate: AnyObject{
    func coordinator(didRequestFinish coordinator: Coordinator, router: Router)
}

public class OtherAppsCoordinator: Coordinator{
    
    public var childCoordinators: [Coordinator] = []
    public let router: Router
    weak var delegate: OtherAppsCoordinatorDelegate?

    private lazy var otherAppsViewController: OtherAppsViewController = {
        let vc = OtherAppsViewController.fromNib(bundle: Bundle.main)
        //vc.isModalInPresentation = true
        return vc
    }()

    init(router: Router){
        self.router = router
    }
    
    deinit{
        print("Deinited:", self)
    }

    public func push(animated: Bool, onDismissed: completion) {
        router.push(otherAppsViewController, animated: true, onDismissed: onDismissed)
    }
    
    public func pushControllers(viewControllers: [UIViewController]) {
        // TODO
    }
}

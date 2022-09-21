//
//  HomeCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import UIKit
import Foundation

protocol HomeCoordinatorDelegate: AnyObject{
    func coordinator(didRequestWebView coordinator: Coordinator, router: Router)
}

public class HomeCoordinator: Coordinator{

    public var childCoordinators: [Coordinator] = []
    public let router: Router
    weak var delegate: HomeCoordinatorDelegate?
    public var navigationController: UINavigationController?

    private lazy var homeViewController: HomeViewController = {
        let vc = HomeViewController.fromNib(bundle: Bundle.main)
        //vc.title = "Naslovnica"
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
        router.push(homeViewController, animated: animated, onDismissed: onDismissed)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate{
    func viewController(didRequestProceed vc: UIViewController) {
        self.delegate?.coordinator(didRequestWebView: self, router: router)
    }
}

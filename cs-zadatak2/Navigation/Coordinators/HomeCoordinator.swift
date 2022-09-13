//
//  HomeCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//


import Foundation
import UIKit

protocol HomeCoordinatorDelegate: AnyObject{
    func coordinator(didRequestSummary coordinator: Coordinator, router: Router)
}

public class HomeCoordinator: Coordinator{

    public var childCoordinators: [Coordinator] = []
    public let router: Router
    weak var delegate: HomeCoordinatorDelegate?

    private lazy var homeViewController: HomeViewController = {
        let vc = HomeViewController.fromNib(bundle: Bundle.main)
        vc.title = "HomeViewController"
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
        router.push(homeViewController, animated: true, onDismissed: onDismissed)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate{
    func viewController(didRequestProceed vc: UIViewController) {
        print("triggeres")
        self.delegate?.coordinator(didRequestSummary: self, router: router)
    }
}


//
//  HomeCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import UIKit
import Foundation

public class HomeCoordinator: Coordinator{
    public var childCoordinators: [Coordinator] = []
    public let router: Router
    public var navigationController: UINavigationController?

    private lazy var homeViewController: HomeViewController = {
        let vc = HomeViewController.fromNib(bundle: Bundle.main)
        vc.title = "Vijesti"
        vc.tabBarItem.title = "Naslovnica"
        vc.tabBarItem.image = UIImage(systemName: "house")
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
    func viewController(didRequestProceed vc: UIViewController, url: String, title: String) {
        let coordinator = NewsWebViewCoordinator(router: self.router, url: url, title: title)
        coordinator.delegate = self
        pushChild(coordinator, animated: true){
            print("gotovo")
        }
    }
}

extension HomeCoordinator: NewsWebViewCoordinatorDelegate{
    func coordinator(didRequestFinish coordinator: Coordinator, router: Router) {
        
    }
}


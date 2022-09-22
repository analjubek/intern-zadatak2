//
//  SearchCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 13.09.2022..
//

import UIKit
import Foundation

public class SearchCoordinator: Coordinator{

    public var childCoordinators: [Coordinator] = []
    public let router: Router

    private lazy var searchViewController: SearchViewController = {
        let vc = SearchViewController.fromNib(bundle: Bundle.main)
        vc.title = "Pretraga"
        vc.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        return vc
    }()

    public init(router: Router){
        self.router = router
    }
    
    deinit{
        print("Deinited:", self)
    }

    public func push(animated: Bool, onDismissed: completion) {
        router.push(searchViewController, animated: true, onDismissed: onDismissed)
    }
}

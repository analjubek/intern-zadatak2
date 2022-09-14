//
//  SearchCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 13.09.2022..
//

import UIKit
import Foundation

//protocol SearchCoordinatorDelegate: AnyObject{
//    func coordinator(didRequestSummary coordinator: Coordinator, router: Router)
//}

public class SearchCoordinator: Coordinator{

    public var childCoordinators: [Coordinator] = []
    public let router: Router
//    weak var delegate: SearchCoordinatorDelegate?

    private lazy var searchViewController: SearchViewController = {
        let vc = SearchViewController.fromNib(bundle: Bundle.main)
        vc.title = "SearchViewController"
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

extension SearchCoordinator: SearchViewControllerDelegate{
    func viewController(didRequestProceed vc: UIViewController) {
//        self.delegate?.coordinator(didRequestSummary: self, router: router)
    }
}


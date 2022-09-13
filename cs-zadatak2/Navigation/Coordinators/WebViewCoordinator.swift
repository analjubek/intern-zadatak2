//
//  WebViewCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 13.09.2022..
//

import Foundation

protocol WebViewCoordinatorDelegate: AnyObject{
    func coordinator(didRequestFinish coordinator: Coordinator, router: Router)
}

class WebViewCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    var router: Router
    weak var delegate: WebViewCoordinatorDelegate?
    
    private lazy var webViewController: WebViewController = {
        let vc = WebViewController.fromNib(bundle: Bundle.main)
        vc.urlString = "https://vijesti.hrt.hr/svijet/zelenski-ukrajina-vratila-kontrolu-nad-otprilike-6000-cetvornih-kilometara-teritorija-9541752"
        return vc
    }()
    
    init(router: Router){
        self.router = router
    }
    
    func push(animated: Bool, onDismissed: completion) {
        router.push(webViewController, animated: animated, onDismissed: onDismissed)
    }
}

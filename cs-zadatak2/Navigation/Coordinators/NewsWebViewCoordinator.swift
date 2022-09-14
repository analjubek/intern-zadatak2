//
//  WebViewCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 13.09.2022..
//

import Foundation

protocol NewsWebViewCoordinatorDelegate: AnyObject{
    func coordinator(didRequestFinish coordinator: Coordinator, router: Router)
}

class NewsWebViewCoordinator: Coordinator{
    var childCoordinators: [Coordinator] = []
    var router: Router
    weak var delegate: NewsWebViewCoordinatorDelegate?
    
    private lazy var webViewController: NewsWebViewController = {
        let vc = NewsWebViewController.fromNib(bundle: Bundle.main)
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

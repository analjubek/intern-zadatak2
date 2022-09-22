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
    
    var title: String
    var url: String
    
    private lazy var webViewController: NewsWebViewController = {
        let vc = NewsWebViewController.fromNib(bundle: Bundle.main)
        vc.title = title
        vc.urlString = self.url
        return vc
    }()
    
    init(router: Router, url: String, title: String){
        self.router = router
        self.url = url
        self.title = title
    }
    
    func push(animated: Bool, onDismissed: completion) {
        router.push(webViewController, animated: animated, onDismissed: onDismissed)
    }
}

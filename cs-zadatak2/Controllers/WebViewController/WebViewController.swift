//
//  ViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 13.09.2022..
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var nbWebViewNavigation: UINavigationBar!
    @IBOutlet var vwNewsWebView: WKWebView!
    
    var urlString: String?
    var url: URL?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = URL(string: urlString!)
        vwNewsWebView.load(URLRequest(url: url!))
    }
}

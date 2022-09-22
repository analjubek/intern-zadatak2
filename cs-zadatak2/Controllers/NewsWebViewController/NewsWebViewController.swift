//
//  ViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 13.09.2022..
//

import UIKit
import WebKit

public class NewsWebViewController: UIViewController {
    @IBOutlet var vwNewsWebView: WKWebView!
    
    var urlString: String?
    var url: URL?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        url = URL(string: urlString!)
        self.vwNewsWebView.load(URLRequest(url: url!))
    }
}

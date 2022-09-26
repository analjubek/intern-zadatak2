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
    
    var viewModel = NewsViewModel()
    var urlString: String?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.vwNewsWebView = self.vwNewsWebView
        viewModel.loadUrl(urlString: self.urlString!)
    }
}

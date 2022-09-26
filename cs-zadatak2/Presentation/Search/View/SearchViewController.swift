//
//  SearchViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import UIKit
import WebKit

protocol SearchViewControllerDelegate: AnyObject{
    func viewController(didRequestProceed vc: UIViewController)
}

public class SearchViewController: UIViewController {
    weak var delegate: SearchViewControllerDelegate?
    
    @IBOutlet var wvSearch: WKWebView!
    @IBOutlet var aiIndicator: UIActivityIndicatorView!
    
    private var viewModel = SearchViewModel()

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        wvSearch.navigationDelegate = self
        
        viewModel.wvSearch = self.wvSearch
        viewModel.loadUrl()
    }
}

extension SearchViewController: WKNavigationDelegate{
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.aiIndicator.stopAnimating()
    }
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.aiIndicator.startAnimating()
    }
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.aiIndicator.startAnimating()
    }
}

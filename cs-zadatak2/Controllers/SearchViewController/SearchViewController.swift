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

class SearchViewController: UIViewController {
    weak var delegate: SearchViewControllerDelegate?
    @IBOutlet var wvSearch: WKWebView!
    
    let url = URL(string: "https://www.hrt.hr/pretraga")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        wvSearch.load(URLRequest(url: url!))
    }
}

//
//  NewsViewModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 26.09.2022..
//

import Foundation
import WebKit

final class NewsViewModel{
    var url: URL?
    var vwNewsWebView: WKWebView?
    
    func loadUrl(urlString: String){
        url = URL(string: urlString)
        self.vwNewsWebView?.load(URLRequest(url: url!))
    }
}

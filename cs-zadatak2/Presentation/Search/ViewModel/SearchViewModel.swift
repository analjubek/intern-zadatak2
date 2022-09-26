//
//  SearchViewModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 26.09.2022..
//

import Foundation
import WebKit

final class SearchViewModel{
    let url = URL(string: "https://www.hrt.hr/pretraga")
    
    var wvSearch: WKWebView?
    
    func loadUrl(){
        self.wvSearch?.load(URLRequest(url: url!))
    }
}

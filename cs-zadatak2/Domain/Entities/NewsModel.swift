//
//  NewsModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 09.09.2022..
//

import Foundation

struct NewsModel{
    var title: String
    var article: String
    var date: String
    var image: String
    var link: String
    
    init(title: String, article: String, date: String, image: String, link: String){
        self.title = title
        self.article = article
        self.date = date
        self.image = image
        self.link = link
    }
}

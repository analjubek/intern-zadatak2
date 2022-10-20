//
//  CategoryModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import Foundation

struct CategoryModel {
    var category: Category
    var categoryName: String
    var isSelected: Bool
    var rssUrl: String
    
    init(category: Category, categoryName: String, isSelected: Bool, rssUrl: String){
        self.category = category
        self.categoryName = categoryName
        self.isSelected = isSelected
        self.rssUrl = rssUrl
    }
}

enum Category{
    case home
    case sport
    case magazine
    case program
    
    func getNumberOfNews() -> Int{
        switch self {
        case .home:
            return 12
        case .sport:
            return 24
        case .magazine:
            return 24
        case .program:
            return 14
        }
    }
    
    func getTitle() -> String{
        switch self {
        case .home:
            return "Naslovnica"
        case .sport:
            return "Sport"
        case .magazine:
            return "Magazin"
        case .program:
            return "Program"
        }
    }
    
    func getUrl() -> String{
        switch self {
        case .home:
            return "https://feed.hrt.hr/vijesti/page.xml"
        case .sport:
            return "https://feed.hrt.hr/sport/page.xml"
        case .magazine:
            return "https://feed.hrt.hr/magazin/page.xml"
        case .program:
            return "https://feed.hrt.hr/hrtprikazuje/page.xml"
        }
    }
}

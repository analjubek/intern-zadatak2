//
//  CategoryModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import Foundation

struct CategoryModel {
    var categoryName: String
    var isSelected: Bool
    var rssUrl: String
    
    init(categoryName: String, isSelected: Bool, rssUrl: String){
        self.categoryName = categoryName
        self.isSelected = isSelected
        self.rssUrl = rssUrl
    }
}

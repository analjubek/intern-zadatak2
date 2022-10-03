//
//  HomeViewModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 26.09.2022..
//

import Foundation

final class HomeViewModel{
    
    var currentCategoryTitle = "Naslovnica"
    
    var categories = [CategoryModel(categoryName: "Naslovnica", isSelected: true, rssUrl: "https://feed.hrt.hr/vijesti/page.xml"), CategoryModel(categoryName: "Sport", isSelected: false, rssUrl: "https://feed.hrt.hr/sport/page.xml"), CategoryModel(categoryName: "Magazin", isSelected: false, rssUrl: "https://feed.hrt.hr/magazin/page.xml"), CategoryModel(categoryName: "Program", isSelected: false, rssUrl: "https://feed.hrt.hr/hrtprikazuje/page.xml")]
    
}

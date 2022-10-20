//
//  HomeViewModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 26.09.2022..
//

import Foundation

final class HomeViewModel{
    private let getNewsUseCase: GetNewsUseCase!

    init(getNewsUseCase: GetNewsUseCase){
        self.getNewsUseCase = getNewsUseCase
    }
    
    var newsList: [NewsModel] = []
    
    var currentCategoryTitle = "Naslovnica"
    
    var categories = [CategoryModel(category: Category.home, categoryName: "Naslovnica", isSelected: true, rssUrl: "https://feed.hrt.hr/vijesti/page.xml"),
                      CategoryModel(category: Category.sport,categoryName: "Sport", isSelected: false, rssUrl: "https://feed.hrt.hr/sport/page.xml"),
                      CategoryModel(category: Category.magazine, categoryName: "Magazin", isSelected: false, rssUrl: "https://feed.hrt.hr/magazin/page.xml"),
                      CategoryModel(category: Category.program, categoryName: "Program", isSelected: false, rssUrl: "https://feed.hrt.hr/hrtprikazuje/page.xml")]
    
    public func load(category: Category) -> [NewsModel]{
        return getNewsUseCase.execute(category: category)
    }
}

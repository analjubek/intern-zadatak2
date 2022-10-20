//
//  DefaultNewsRepository.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 06.10.2022..
//

import Foundation

final class DefaultNewsRepository: NewsRepository {
    func putNewsIntoCoreData(category: Category, completion: @escaping () -> ()) {
        NewsStorage().getNews(url: category.getUrl()){
            
        }
    }
    
    func getNewsFromCoreData(category: Category, completion: @escaping () -> ()) -> [NewsModel] {
        return NewsStorage().fetchNewsFromCoreData(category: category)
    }
}

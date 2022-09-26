//
//  ViewNewsUseCase.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 26.09.2022..
//

import Foundation

final class ViewNewsUseCase{
    private let newsRepository: NewsRepository
    
    init(newsRepository: NewsRepository){
        self.newsRepository = newsRepository
    }
    
    func showNews(category: String) -> [NewsModel]{
        return newsRepository.fetchNewsList(category: category)
    }
}

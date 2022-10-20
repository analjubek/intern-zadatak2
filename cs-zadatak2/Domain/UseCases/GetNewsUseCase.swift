//
//  ViewNewsUseCase.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 26.09.2022..
//

import Foundation


protocol GetNewsUseCase{
    func execute(category: Category) -> [NewsModel]
}

final class DefaultGetNewsUseCase: GetNewsUseCase{
    private let newsRepository: NewsRepository

    init(newsRepository: NewsRepository){
        self.newsRepository = newsRepository
    }

    func execute(category: Category) -> [NewsModel]{
        newsRepository.putNewsIntoCoreData(category: category){

        }
        return (self.newsRepository.getNewsFromCoreData(category: category){})
    }
}

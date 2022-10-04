//
//  NewsRepository.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 26.09.2022..
//

import Foundation

protocol NewsRepository {
    func getNews(category: String, completion: @escaping (Result<[NewsModel], Error>) -> Void) -> Cancellable
    
//    NewsStorage().getNews(url: viewModel.categories[indexPath.row].rssUrl)
//    NewsStorage().fetchNewsByIdFromCoreData(newsId: indexPath.row) -> NewsModel
//    NewsStorage().fetchNewsByIdFromCoreData(newsId: indexPath.row).link
}

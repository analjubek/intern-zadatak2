//
//  NewsRepository.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 26.09.2022..
//

import Foundation

protocol NewsRepository {
    func getNews(category: String, completion: @escaping (Result<[NewsModel], Error>) -> Void) -> Cancellable
}

//
//  SingletonData.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 09.09.2022..
//

import Foundation
import UIKit
import SwiftUI
import CoreData

class DataFunctions {
    var newsItems: [NewsModel]?
    
    func start(){
        let feedParser = FeedParser()
        feedParser.parseFeed(url: "https://feed.hrt.hr/vijesti/page.xml"){ (newsItems) in
            self.newsItems = newsItems
            OperationQueue.main.addOperation {
                self.saveXmlToCoreData(newsItems: newsItems)
            }
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "News")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveXmlToCoreData(newsItems: [NewsModel]){
        print("Saving XML into CoreData...")
        for news in newsItems{
            self.saveNewsToCoreData(title: news.title, article: news.article, image: news.image, date: news.date)
        }
        print("All news saved.")
    }
    
    func saveNewsToCoreData(title: String, article: String, image: String, date: String){
        print("Saving one news into CoreData...")
        let context = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "News", in: context)!
          
        let news = NSManagedObject(entity: entity, insertInto: context)
        
        news.setValue(title, forKeyPath: "title")
        news.setValue(article, forKey: "article")
        news.setValue(image, forKey: "image")
        news.setValue(date, forKey: "date")
          
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        print("One news saved.")
    }
    
    func fetchNewsFromCoreData() -> [NSManagedObject]?{
        print("Fetching news from CoreData...")
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "News")
        
        do {
            print("News fetched.")
            return try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func fetchNewsByIdFromCoreData(newsId: Int) -> NewsModel{
        print("Fetching news with id", newsId)
        let context = persistentContainer.viewContext
        var news = NewsModel(title: "", article: "", date: "", image: "")
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "News")
        
        do {
            let newsDataCore = try context.fetch(fetchRequest)
            news.title = (newsDataCore[newsId].value(forKey: "title") as? String)!
            news.article = (newsDataCore[newsId].value(forKey: "article") as? String)!
            news.date = (newsDataCore[newsId].value(forKey: "date") as? String)!
            news.image = (newsDataCore[newsId].value(forKey: "image") as? String)!
            
            return news
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return news
        }
    }
    
//    func deleteAllCoreData(entity: String){
//        let context = persistentContainer.viewContext
//        let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
//        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
//        do { try context.execute(DelAllReqVar) }
//        catch { print(error) }
//    }
}

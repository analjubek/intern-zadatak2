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

class SingletonData {
    static let shared = SingletonData()
    
    var newsItems: [NewsModel]?
    
    private init(){
        
    }
    
    func start(){
        let feedParser = FeedParser()
        feedParser.parseFeed(url: "https://feed.hrt.hr/vijesti/page.xml"){ (newsItems) in
            self.newsItems = newsItems
            OperationQueue.main.addOperation {
                print("Data from XML fetched.")
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
        print("All news saved into CoreData.")
    }
    
    func saveNewsToCoreData(title: String, article: String, image: String, date: String){
        print("Trying to save one news into CoreData...")
        
        let context = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "News", in: context)!
          
        let news = NSManagedObject(entity: entity, insertInto: context)
        
        news.setValue(title, forKeyPath: "title")
        news.setValue(article, forKey: "article")
        news.setValue(image, forKey: "image")
        news.setValue(date, forKey: "date")
          
        do {
            try context.save()
            print("One news saved into CoreData.")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchNewsFromCoreData() -> [NSManagedObject]?{
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "News")
        
        do {
            return try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    /*
    func fetchNewsByIdFromCoreData(colorId: Int) -> NewsModel{
        let context = persistentContainer.viewContext
        var rgb = Rgb(r: -1, g: -1, b: -1)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CoreColor")
        
        do {
            let coreColors = try context.fetch(fetchRequest)
            rgb.r = (coreColors[colorId].value(forKey: "r") as? Int)!
            rgb.g = (coreColors[colorId].value(forKey: "g") as? Int)!
            rgb.b = (coreColors[colorId].value(forKey: "b") as? Int)!
            
            return rgb
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return rgb
        }
    }*/
    
    
    /*func fetchColorByIdFromCoreData(colorId: Int) -> Rgb{
        let context = persistentContainer.viewContext
        var rgb = Rgb(r: -1, g: -1, b: -1)
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CoreColor")
        
        do {
            let coreColors = try context.fetch(fetchRequest)
            rgb.r = (coreColors[colorId].value(forKey: "r") as? Int)!
            rgb.g = (coreColors[colorId].value(forKey: "g") as? Int)!
            rgb.b = (coreColors[colorId].value(forKey: "b") as? Int)!
            
            return rgb
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return rgb
        }
    }
    
    func deleteAllCoreData(entity: String){
        let context = persistentContainer.viewContext
        let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
        do { try context.execute(DelAllReqVar) }
        catch { print(error) }
    }*/
}

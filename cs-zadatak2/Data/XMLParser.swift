//
//  XMLParser.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 09.09.2022..
//

import Foundation
import UIKit
import SwiftUI

class FeedParser: NSObject, XMLParserDelegate{
    private var newsItems: [NewsModel] = [] // RSS Items
    private var currentElement = ""
    private var currentTitle: String = ""{
        didSet{
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentArticle: String = ""{
        didSet{
            currentArticle = currentArticle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDate: String = ""{
        didSet{
            currentDate = currentDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentImage: String = ""{
        didSet{
            currentImage = currentImage.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentLink: String = ""{
        didSet{
            currentLink = currentLink.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var parserCompletionHandler: (([NewsModel]) -> ())?
    
    func parseFeed(url: String, completionHandler: (([NewsModel]) -> ())?){
        self.parserCompletionHandler = completionHandler
        
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request){ (data, response, error) in
            guard let data = data else{
                if let error = error{
                    print(error.localizedDescription)
                }
                return
            }
            
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        
        task.resume()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]){
        currentElement = elementName
        if currentElement == "item"{
            currentTitle = ""
            currentArticle = ""
            currentDate = ""
            currentImage = ""
            currentLink = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement{
        case "title": currentTitle += string
        case "description": currentArticle += string
        case "pubDate": currentDate += string
        case "image": currentImage += string
        case "link": currentLink += string
        default: break
        }
    }

    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item"{
            let newsItem = NewsModel(title: currentTitle, article: currentArticle, date: currentDate, image: currentImage, link: currentLink)
            self.newsItems.append(newsItem)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(newsItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
}


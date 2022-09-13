//
//  News+CoreDataProperties.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 13.09.2022..
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var article: String?
    @NSManaged public var date: String?
    @NSManaged public var image: String?
    @NSManaged public var title: String?
    @NSManaged public var link: String?

}

extension News : Identifiable {

}

//
//  News+CoreDataProperties.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 12.09.2022..
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var title: String?
    @NSManaged public var article: String?
    @NSManaged public var date: String?
    @NSManaged public var image: String?

}

extension News : Identifiable {

}

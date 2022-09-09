//
//  CategoryModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import Foundation
import UIKit

struct CategoryModel {
    var categoryName: String
    var isSelected: Bool
    
    init(categoryName: String, isSelected: Bool){
        self.categoryName = categoryName
        self.isSelected = isSelected
    }
}

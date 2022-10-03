//
//  SettingModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 27.09.2022..
//

import Foundation

struct SettingModel {
    var title: String
    var isArrowVisible: Bool
    var settingType: Setting
    
    init(title: String, isArrowVisible: Bool, settingType: Setting){
        self.title = title
        self.isArrowVisible = isArrowVisible
        self.settingType = settingType
    }
}

enum Setting{
    case rules
    case others
    case version
}

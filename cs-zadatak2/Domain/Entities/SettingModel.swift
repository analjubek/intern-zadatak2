//
//  SettingModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 27.09.2022..
//

import Foundation

struct SettingModel {
    var setting: String
    var isArrowVisible: Bool
    
    init(setting: String, isArrowVisible: Bool){
        self.setting = setting
        self.isArrowVisible = isArrowVisible
    }
}

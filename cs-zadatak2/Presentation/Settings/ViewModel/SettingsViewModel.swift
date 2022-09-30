//
//  SettingsViewModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 26.09.2022..
//

import Foundation

final class SettingsViewModel{
    let settings = [SettingModel(setting: "Pravila korištenja i privatnosti", isArrowVisible: true),
                    SettingModel(setting: "Ostale HRT aplikacije", isArrowVisible: true),
                    SettingModel(setting: "Verzija: 1.5.1", isArrowVisible: false)]
    
    let terms = "https://o-nama.hrt.hr/zastita-privatnosti-i-pravo-na-pristup-informacijama/uvjeti-koristenja-sadrzaja-objavljenog-na-hrt-ovim-digitalnim-platformama-4423"
}

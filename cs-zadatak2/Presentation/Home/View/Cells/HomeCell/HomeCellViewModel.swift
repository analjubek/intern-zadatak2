//
//  HomeCellViewModel.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 27.09.2022..
//

import Foundation
import UIKit

final class HomeCellViewModel{
    var lblTitle: UILabel!
    var lblDescription: UILabel!
    var lblDate: UILabel!
    var imgNewsImage: UIImageView!
    
    init(lblTitle: UILabel, lblDescription: UILabel, lblDate: UILabel, imgNewsImage: UIImageView){
        self.lblTitle = lblTitle
        self.lblDescription = lblDescription
        self.lblDate = lblDate
        self.imgNewsImage = imgNewsImage
    }
    
    func setup(newsData: NewsModel){
        lblTitle.text = newsData.title
        lblDescription.text = newsData.article
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let date = formatter.date(from: newsData.date)
        
        let now = Date()
        let elapsedTime = now.timeIntervalSince(date!)
        
        var time = 0
        var stringTime = ""
        
        if (elapsedTime/60 < 60){
            time = Int(elapsedTime/60.0)
            stringTime = ("Prije \(time) m")
        }
        else if (elapsedTime/60/60 < 24) {
            time = Int(elapsedTime/60/60)
            stringTime = ("Prije \(time) h")
        }
        else{
            time = Int(elapsedTime/60/60/24)
            stringTime = ("Prije \(time) d")
        }
        
        lblDate.text = stringTime
    
        imgNewsImage.sd_setImage(with: URL(string: newsData.image))
    }
}

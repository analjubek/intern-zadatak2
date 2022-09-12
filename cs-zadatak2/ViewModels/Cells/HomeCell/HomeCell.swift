//
//  HomeCell.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 09.09.2022..
//

import UIKit

class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var imgNewsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupHomeCell(newsData: NewsModel){
        self.lblTitle.text = newsData.title
        
        self.lblDescription.text = newsData.article
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let date = formatter.date(from: newsData.date)
        
        let now = Date()
        let elapsedTime = now.timeIntervalSince(date!)
        
        var time = 0
        var stringTime = ""
        if (elapsedTime/60 < 1){
            time = Int(elapsedTime/60.0)
            stringTime = ("Prije \(time) m")
        }
        else {
            time = Int(elapsedTime/60/60)
            stringTime = ("Prije \(time) h")
        }
        self.lblDate.text = stringTime
        
        self.imgNewsImage.loadFrom(URLAddress: newsData.image)
    }
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

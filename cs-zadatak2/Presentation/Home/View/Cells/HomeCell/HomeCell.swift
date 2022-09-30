//
//  HomeCell.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 09.09.2022..
//

import UIKit
import SDWebImage

class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var imgNewsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupHomeCell(newsData: NewsModel){
        let cellModel = HomeCellViewModel(lblTitle: self.lblTitle, lblDescription: self.lblDescription, lblDate: self.lblDate, imgNewsImage: self.imgNewsImage)
        cellModel.setup(newsData: newsData)
    }
}

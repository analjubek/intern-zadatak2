//
//  SmallHomeCell.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 15.09.2022..
//

import UIKit

class SmallHomeCell: UITableViewCell {
    static let identifier = "SmallHomeCell"

    @IBOutlet var ivSmallHomeCell: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

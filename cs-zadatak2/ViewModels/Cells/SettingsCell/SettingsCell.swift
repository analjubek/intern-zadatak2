//
//  SettingsCell.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 14.09.2022..
//

import UIKit

class SettingsCell: UITableViewCell {
    static let identifier = "SettingsCell"
    
    @IBOutlet var lblSetting: UILabel!
    @IBOutlet var ivArrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivArrow.image = UIImage(systemName: "chevron.forward")
        ivArrow.tintColor = .darkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
    }
    
}

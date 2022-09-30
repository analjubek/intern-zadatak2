//
//  ContactCell.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 14.09.2022..
//

import UIKit

class ContactCell: UITableViewCell {
    static let identifier = "ContactCell"
    
    @IBOutlet var lblContact: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {

    }
}

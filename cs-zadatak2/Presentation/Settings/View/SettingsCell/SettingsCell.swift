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
    
    let viewModel = SettingsViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: SettingModel){
        switch viewModel.settingType{
        case .rules:
            lblSetting.text = viewModel.title
            setupCellArrow(isArrowVisible: viewModel.isArrowVisible)
        case .others:
            lblSetting.text = viewModel.title
            setupCellArrow(isArrowVisible: viewModel.isArrowVisible)
        case .version:
            lblSetting.text = viewModel.title
            setupCellArrow(isArrowVisible: viewModel.isArrowVisible)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

    }
    
    func setupCellArrow(isArrowVisible: Bool){
        if (isArrowVisible){
            ivArrow.image = UIImage(systemName: "chevron.forward")
            ivArrow.tintColor = .darkGray
        }
        else{
            ivArrow.isHidden = true
        }
    }
}

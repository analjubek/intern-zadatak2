//
//  CategoryCell.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 08.09.2022..
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
        
    @IBOutlet var containerView: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var vwUnderline: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCategoryCell(categoryData: CategoryModel){
        lblTitle.text = categoryData.categoryName
        if(categoryData.isSelected){
            lblTitle.textColor = .black
            vwUnderline.isHidden = false
        }
        else{
            lblTitle.textColor = .lightGray
            vwUnderline.isHidden = true
        }
    }
}

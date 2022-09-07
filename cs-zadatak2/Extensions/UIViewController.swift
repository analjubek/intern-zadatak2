//
//  UIViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import Foundation
import UIKit

extension UIViewController{
    
    class func fromNib(bundle: Bundle) -> Self {
        return self.init(nibName: String(describing:self), bundle: bundle)
    }
}

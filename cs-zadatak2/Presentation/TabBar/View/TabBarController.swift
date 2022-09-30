//
//  TabBarControllerViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import UIKit

public class TabBarController: UITabBarController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
    }
}

//
//  TabBarControllerViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import UIKit

protocol TabBarControllerDelegate: AnyObject{
    func viewController(didRequestProceed vc: UIViewController)
}


class TabBarController: UITabBarController {
    let homeViewController = HomeViewController()
    let settingsViewController = SettingsViewController()
    let contactViewController = ContactViewController()
    let searchViewController = SearchViewController()
    
    //weak var delegate: UITabBarControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewController.title = "Naslovnica"
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        settingsViewController.title = "Postavke"
        settingsViewController.tabBarItem.image = UIImage(systemName: "gearshape")
        contactViewController.title = "Kontakt"
        contactViewController.tabBarItem.image = UIImage(systemName: "phone")
        searchViewController.title = "Pretraga"
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        self.setViewControllers([homeViewController, settingsViewController, contactViewController, searchViewController], animated: true)
        
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
    }
}

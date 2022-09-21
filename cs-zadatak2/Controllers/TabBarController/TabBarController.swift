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

public class TabBarController: UITabBarController {
//    public let homeViewController = HomeViewController()
//    public let settingsViewController = SettingsViewController()
//    public let contactViewController = ContactViewController()
//    public let searchViewController = SearchViewController()
    
    //weak public var delegate: TabBarControllerDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
//        homeViewController.title = "Naslovnica"
//        homeViewController.tabBarItem.image = UIImage(systemName: "house")
//        settingsViewController.title = "Postavke"
//        settingsViewController.tabBarItem.image = UIImage(systemName: "gearshape")
//        contactViewController.title = "Kontakt"
//        contactViewController.tabBarItem.image = UIImage(systemName: "phone")
//        searchViewController.title = "Pretraga"
//        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
//
//        let items = [homeViewController, settingsViewController, contactViewController, searchViewController]
        
//        self.setViewControllers(items, animated: true)
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
    }
}

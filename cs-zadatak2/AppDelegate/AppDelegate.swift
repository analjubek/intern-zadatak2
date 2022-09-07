//
//  AppDelegate.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 06.09.2022..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    public lazy var coordinator = TabBarCoordinator(router: router)
    public lazy var router = AppDelegateRouter(window: window!)
    public lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        coordinator.push(animated: true, onDismissed: nil)
        return true
    }
}



//
//  AppDelegate.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 06.09.2022..
//

import UIKit
import LeakedViewControllerDetector

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    public lazy var coordinator = TabBarCoordinator(router: router)
    public lazy var router = AppDelegateRouter(window: window!)
    public lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SingletonData.shared.start()
        
        coordinator.push(animated: true, onDismissed: nil)
        
        LeakedViewControllerDetector.onDetect() { leakedViewController, leakedView, message in
            #if DEBUG
            return true //show warning alert dialog
            #else
            //log warning message to a server, e.g. Crashlytics
            return false //don't show warning to user
            #endif
            
        }
        return true
    }
}



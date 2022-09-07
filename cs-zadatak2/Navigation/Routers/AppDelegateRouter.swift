//
//  AppDelegateRouter.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import Foundation
import UIKit

protocol AppDelegateAlias{
    typealias completion = (() -> Void)?
}

public class AppDelegateRouter: Router, AppDelegateAlias{
    
    public let window: UIWindow
    
    public init(window: UIWindow){
        self.window = window
    }
    
    // MARK: - Router
    
      public func push(_ viewController: UIViewController, animated: Bool, onDismissed: completion) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
      }
    
      public func dismiss(animated: Bool) {
        // don't do anything
    }
}

//
//  AppCoordinator.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 16.09.2022..
//

import Foundation
import UIKit

public class AppCoordinator: Coordinator{
    public var router: Router
    public var childCoordinators: [Coordinator] = []
    
    public lazy var coordinator = TabBarCoordinator(router: router)
    
    init(router: Router){
        self.router = router
    }
    
    public func push(animated: Bool, onDismissed: completion) {
        coordinator.push(animated: animated, onDismissed: onDismissed)
    }
}

//
//  Array.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 21.09.2022..
//

import Foundation
import UIKit

extension Array where Element == Coordinator {
    var navigationControllers: [UINavigationController]{
        return self.compactMap({ coordinator in
            coordinator.push(animated: true, onDismissed: nil)
            return (coordinator.router as? NavigationRouter)?.navigationController
        })
    }
}

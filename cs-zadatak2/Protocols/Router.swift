//
//  Router.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//
import Foundation
import UIKit

public protocol RouterAlias{
    typealias completion = (() -> Void)?
}

public protocol Router: AnyObject, RouterAlias{
    
    func push(_ viewController: UIViewController, animated: Bool)

    func push(_ viewController: UIViewController, animated: Bool, onDismissed: completion)
    
    func dismiss(animated: Bool)
}

extension Router{
    
    public func push(_ viewController: UIViewController, animated: Bool){
        push(viewController, animated: animated, onDismissed: nil)
    }
}

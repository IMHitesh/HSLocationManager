//
//  UIApplication+Extension.swift
//  HSLocationManager
//
//  Created by Hitesh on 03/06/19.
//  Copyright © 2019 Hitesh. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        
        return viewController
    }
    
    class func topNavigation(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UINavigationController? {
        
        if let nav = viewController as? UINavigationController {
            return nav
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return selected.navigationController
            }
        }
        if let presented = viewController?.presentedViewController {
            return topNavigation(presented)
        }
        
        
        return viewController?.navigationController
    }
}


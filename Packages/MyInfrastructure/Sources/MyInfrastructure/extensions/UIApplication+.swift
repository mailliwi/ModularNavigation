//
//  UIApplication+.swift
//  MyInfrastructure

import SwiftUI
import UIKit

extension UIApplication {
    
    var keyWindow: UIWindow? {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .last { $0.isKeyWindow }
    }
    
    
    /// Recursively retrieves the top-most visible `UIViewController` in the view hierarchy.
    ///
    /// This method is useful in scenarios where you need to find the currently visible
    /// view controller, regardless of whether it is presented, embedded in a `UINavigationController`,
    /// or part of a `UITabBarController`. It also supports `UIHostingController` to
    /// account for SwiftUI views wrapped in UIKit.
    ///
    /// - Parameters:
    ///   - viewController: The starting `UIViewController` from which to traverse the hierarchy.
    ///   Defaults to the `rootViewController` of the application's key window if not provided.
    ///
    /// - Returns: The top-most visible `UIViewController` in the view hierarchy, or `nil` if no visible view controller exists.
    ///
    /// - Note: For SwiftUI views, this method will return the `UIHostingController` wrapping the view,
    ///   allowing interaction with the UIKit container for the SwiftUI hierarchy.
    
    class func topViewController(
        from viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
    ) -> UIViewController? {
        if let presentedViewController = viewController?.presentedViewController {
            // Recursively find the topmost presented view controller
            return topViewController(from: presentedViewController)
            
        } else if let navigationController = viewController as? UINavigationController {
            // Get the visible view controller from a navigation controller
            return topViewController(from: navigationController.visibleViewController ?? viewController)
            
        } else if let tabBarController = viewController as? UITabBarController,
                  let selectedViewController = tabBarController.selectedViewController {
            // Get the visible view controller from a tab bar controller
            return topViewController(from: selectedViewController)
            
        } else if let hostingController = viewController as? UIHostingController<AnyView> {
            // Get the SwiftUI view wrapped in a UIHostingController
            return hostingController
        }
        
        
        return viewController
    }
    
}

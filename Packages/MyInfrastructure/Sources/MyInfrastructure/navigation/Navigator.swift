//
//  Navigator.swift
//  MyInfrastructure

import UIKit

/// Defines navigation operations within the app.
@MainActor
public protocol Navigator {
    
    /// The root navigation controller through which all pushes, pops, and presentations occur.
    var rootNavigationController: UINavigationController? { get set }
    
    /// Navigate to a specific screen.
    ///
    /// - Parameters:
    ///   - route: A `Route` enum value describing which associated view to show for that value.
    ///   - presentationStyle: The style used to navigate to a new view.
    func navigate(to route: Route, presentationStyle: PresentationStyle)
    
    /// Pops all view controllers on the navigation stack, returning to the root.
    func popToRootViewController()
    
    // TODO: Implementing the following would be beneficial for the SubMenu navigation case
    /// Pops view controllers until the first instance of the given class
    /// is at the top of the stack.
    ///
    /// - Parameters:
    ///   - viewControllerClass: The `UIViewController.Type` to pop back to.
    // popToFirstInstanceOf(_ viewControllerClass: UIViewController)
    
}

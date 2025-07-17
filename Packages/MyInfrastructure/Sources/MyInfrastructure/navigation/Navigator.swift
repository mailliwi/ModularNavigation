//
//  Navigator.swift
//  MyInfrastructure

import UIKit

// MARK: - Navigator
//

@MainActor
public protocol Navigator {
    
    var rootNavigationController: UINavigationController? { get set }
    
    func navigate(to route: Route, presentationStyle: PresentationStyle)
    func popToRoot()
    
}

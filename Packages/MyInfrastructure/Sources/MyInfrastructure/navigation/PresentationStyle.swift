//
//  PresentationStyle.swift
//  MyInfrastructure

import Foundation

/// The presentation style used when navigating to a new view.
public enum PresentationStyle {
    
    /// Pushes a new view onto the root navigation controller.
    /// - Parameters:
    ///    - hideBackButton: When set to `true`, disables navigating back on the newly pushed view.
    case push(hideBackButton: Bool = false)
    
    /// Modally presents a new view onto an existing view.
    /// - Parameters:
    ///   - overFullScreen: When set to `true`, the view being pushed takes the entirety of the screen, and allows see-through content.
    case present(overFullScreen: Bool = false)
    
}

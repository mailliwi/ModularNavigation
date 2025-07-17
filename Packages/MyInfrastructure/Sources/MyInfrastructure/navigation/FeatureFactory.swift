//
//  FeatureFactory.swift
//  MyInfrastructure

import UIKit

/// A type conforming to `FeatureFactory` means it is responsible for creating feature-specific view controllers based on a `Route` value.
/// Conforming types should know how to assemble and configure view controllers for each case in the app’s `Route` enum.
@MainActor
public protocol FeatureFactory {
    
    /// Builds and returns the view controller corresponding to a given route.
    ///
    /// - Parameters:
    ///   - route: A `Route` enum value indicating which screen or feature
    ///   should be instantiated.
    /// - Returns: A fully configured `UIViewController` ready for presentation.
    func makeViewController(for route: Route) -> UIViewController
    
}

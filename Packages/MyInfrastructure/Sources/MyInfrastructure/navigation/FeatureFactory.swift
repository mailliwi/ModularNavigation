//
//  FeatureFactory.swift
//  MyInfrastructure

import UIKit

@MainActor
public protocol FeatureFactory {
    
    func makeViewController(for route: Route) -> UIViewController
    
}

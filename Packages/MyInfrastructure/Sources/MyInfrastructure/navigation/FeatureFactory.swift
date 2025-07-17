//
//  FeatureFactory.swift
//  MyInfrastructure

import UIKit

@MainActor
public protocol FeatureFactory {
    
    func makeFeature(for route: Route) -> UIViewController
    
}

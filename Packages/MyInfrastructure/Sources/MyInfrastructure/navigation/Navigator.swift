//
//  Navigator.swift
//  MyInfrastructure

import UIKit

// MARK: - Navigator
//

public protocol Navigator {
    var rootNavigationController: UINavigationController? { get set }
    
    @MainActor
    func navigate(to route: Route, presentationStyle: PresentationStyle)
}

// MARK: - Feature Factory
//

public protocol FeatureFactory {
    func makeFeature(for route: Route) -> UIViewController
}

// MARK: - Default Navigator
//

public final class DefaultNavigator: Navigator {
    
    // MARK: - Properties
    //
    
    public weak var rootNavigationController: UINavigationController?
    private let featureFactory: FeatureFactory
    
    // MARK: - Initializers
    //
    
    public init(
        navigationController: UINavigationController?,
        featureFactory: FeatureFactory
    ) {
        self.rootNavigationController = navigationController
        self.featureFactory = featureFactory
    }
    
    // MARK: - Functions
    //
    
    public func navigate(to route: Route, presentationStyle: PresentationStyle) {
        let viewController = featureFactory.makeFeature(for: route)
        
        switch presentationStyle {
        case .push:
            rootNavigationController?.pushViewController(viewController, animated: true)
            
        case .present(let modal):
            viewController.modalPresentationStyle = modal ? .automatic : .overFullScreen
            rootNavigationController?.present(viewController, animated: true)
        }
    }
    
}


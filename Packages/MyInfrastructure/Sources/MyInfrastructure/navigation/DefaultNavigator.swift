//
//  DefaultNavigator.swift
//  MyInfrastructure

import UIKit

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
        let viewController = featureFactory.makeViewController(for: route)
        
        switch presentationStyle {
        case .push(let hideBackButton):
            if hideBackButton { viewController.navigationItem.hidesBackButton = true }
            rootNavigationController?.pushViewController(viewController, animated: true)
            
        case .present(let overFullScreen):
            if overFullScreen { viewController.modalPresentationStyle = .overFullScreen }
            rootNavigationController?.present(viewController, animated: true)
        }
        
        printViewControllersArray()
    }
    
    public func popToRootViewController() {
        guard let navigationController = rootNavigationController,
              let rootViewController = rootNavigationController?.viewControllers.first,
              let topViewController = UIApplication.topViewController() // Ensures we get the top most VC, even if it is a modal.
        else {
            // Show an alert or some kind of error if can't proceed with popping.
            return
        }
        
        topViewController.dismiss(animated: true) {
            navigationController.popToViewController(rootViewController, animated: true)
        }
        
        printViewControllersArray()
    }
    
    private func printViewControllersArray() {
        print("📑 Array of VCs:")
        print(rootNavigationController?.viewControllers ?? [])
    }
    
}

//
//  Navigator.swift
//  MyInfrastructure

import UIKit

// MARK: - Navigator
//

@MainActor
public protocol Navigator {
    var rootNavigationController: UINavigationController? { get set }
    
    @MainActor
    func navigate(to route: Route, presentationStyle: PresentationStyle)
    func popToRoot()
}

// MARK: - Feature Factory
//

@MainActor
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
        case .push(let hideBackButton):
            if hideBackButton { viewController.navigationItem.hidesBackButton = true }
            rootNavigationController?.pushViewController(viewController, animated: true)
            
        case .present(let overFullScreen):
            if overFullScreen { viewController.modalPresentationStyle = .overFullScreen }
            rootNavigationController?.present(viewController, animated: true)
        }
        
        printViewControllers()
    }
    
    public func popToRoot() {
        guard let navigationController = rootNavigationController else { return }
        guard let rootViewController = rootNavigationController?.viewControllers.first,
              let topViewController = topViewController()
        else {
            return
        }
        
        topViewController.dismiss(animated: true) {
            navigationController.popToViewController(rootViewController, animated: true)
        }
        
        printViewControllers()
    }
    
    private func topViewController() -> UIViewController? {
        guard let keyWindow = UIApplication.shared.keyWindow,
              let rootViewController = keyWindow.rootViewController
        else {
            return nil
        }
        
        return UIApplication.topViewController(from: rootViewController)
    }
    
    private func printViewControllers() {
        print("📑 Array of VCs:")
        print(rootNavigationController?.viewControllers ?? [])
    }
    
}

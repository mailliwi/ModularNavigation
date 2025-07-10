//
//  NavigationHandler.swift
//  MyInfrastructure

import UIKit

@MainActor
public class NavigationHandler {
    
    public func present(
        from baseVC: UIViewController,
        to presentingVC: UIViewController,
        isFullscreen: Bool,
        userInfo: [String: Any]? = nil,
        animated: Bool = true
    ) {
        let navigationController = UINavigationController(rootViewController: presentingVC)
        if isFullscreen { navigationController.modalPresentationStyle = .overFullScreen }
        (presentingVC as? BaseViewController)?.userInfo = userInfo ?? [:]
        baseVC.present(navigationController, animated: animated)
    }
    
    public func push(
        from navigationController: UINavigationController,
        to presentingVC: UIViewController,
        userInfo: [String: Any]? = nil,
        animated: Bool = true
    ) {
        (presentingVC as? BaseViewController)?.userInfo = userInfo ?? [:]
        navigationController.pushViewController(presentingVC, animated: animated)
    }
    
}

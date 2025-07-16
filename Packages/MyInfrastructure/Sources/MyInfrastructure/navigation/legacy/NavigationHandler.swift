//
//  NavigationHandler.swift
//  MyInfrastructure

import MyBase
import UIKit

/// ⚠️
/// This class is a lightweight version of the original implementation.
/// It does not work because this module depends on 
/// It has been left in this project as a way to visualize/understand what the issue at hand is.
/// ⚠️

//@MainActor
//public class NavigationHandler {
//    
//    public func push(
//        from navigationController: UINavigationController,
//        to presentingVC: UIViewController,
//        userInfo: [String: Any]? = nil,
//        animated: Bool = true
//    ) {
//        (presentingVC as? BaseViewController)?.userInfo = userInfo ?? [:]
//        navigationController.pushViewController(presentingVC, animated: animated)
//    }
//    
//    public func present(
//        from baseVC: BaseViewController,
//        to presentingVC: UIViewController,
//        userInfo: [String: Any]? = nil,
//        animated: Bool = true
//    ) {
//        let navigationController = UINavigationController(rootViewController: presentingVC)
//        (presentingVC as? BaseViewController)?.userInfo = userInfo ?? [:]
//        baseVC.present(navigationController, animated: animated)
//    }
//    
//}
//
//extension NavigationHandler {
//    
//    public func navigateToFirstViewController(with data: FirstVCData) {
//        let firstViewController = MainAssembler.shared.resolveFirstViewController()
//        push(
//            from: navigationController,
//            to: firstViewController,
//            userInfo: userInfo
//        )
//    }
//    
//    public func navigateToSecondViewController(baseVC: BaseViewController) {
//        let secondViewController = MainAssembler.shared.resolveSecondViewController()
//        let userInfo = [
//            "someKey": "Some value",
//            "someOtherKey": "Some other value"
//        ] as [String: Any]
//        
//        present(
//            from: baseVC,
//            to: secondViewController,
//            userInfo: userInfo
//        )
//    }
//    
//    public func navigateToThirdViewController(baseVC: BaseViewController) {
//        let secondViewController = MainAssembler.shared.resolveThirdViewController()
//        present(from: baseVC, to: secondViewController)
//    }
//    
//}

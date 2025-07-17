//
//  MainAssembler2+LoginFeature.swift
//  LoginFeature

import MyInfrastructure
import UIKit

@MainActor
extension MainAssembler2 {
    
    public func assembleLoginViewController() -> UIViewController {
        return LoginViewController(navigator: navigator)
    }
    
}

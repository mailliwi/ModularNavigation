//
//  MainAssembler2+LoginFeature.swift
//  LoginFeature

import MyInfrastructure
import UIKit

extension MainAssembler2 {
    
    public func assembleLoginViewController() -> UIViewController {
        return LoginViewController(navigator: navigator)
    }
    
}

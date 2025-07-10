//
//  BaseViewController.swift
//  MyInfrastructure

import UIKit

open class BaseViewController: UIViewController {
    
    public var userInfo: [String: Any] = [:]
    public var navigationHandler = NavigationHandler()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }

}

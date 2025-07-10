//
//  BaseViewController.swift
//  MyInfrastructure

import UIKit

public class BaseViewController: UIViewController {
    
    public var userInfo: [String: Any] = [:]
    public var navigationHandler = NavigationHandler()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }

}

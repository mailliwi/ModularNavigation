//
//  MainAssembler2.swift
//  MyInfrastructure

import MyBase
import UIKit

public final class MainAssembler2: @unchecked Sendable {
    
    // MARK: - Properties
    //
    
    public static let shared = MainAssembler2()
    
    public var keychain: Keychain
    public var networkService: NetworkService
    public let navigationHandler: NavigationHandler
    
    // MARK: - Initializers
    //
    
    private init() {
        let keychain = Keychain()
        self.keychain = keychain
        self.networkService = NetworkService(keychain: keychain)
        self.navigationHandler = NavigationHandler()
    }
    
}

@MainActor
extension MainAssembler2 {
    
    // MARK: - Navigation
    //
    
    
    
}

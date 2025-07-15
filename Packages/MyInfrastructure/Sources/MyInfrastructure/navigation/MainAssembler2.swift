//
//  MainAssembler2.swift
//  MyInfrastructure

import MyBase
import UIKit

public final class MainAssembler2: @unchecked Sendable {
    
    public static let shared = MainAssembler2()
    
    public var keychain: Keychain
    public var networkService: NetworkService
    public let navigationHandler: NavigationHandler
    
    private init() {
        let keychain = Keychain()
        self.keychain = keychain
        self.networkService = NetworkService(keychain: keychain)
        self.navigationHandler = NavigationHandler()
    }
    
}

@MainActor
extension MainAssembler2 {
    
    public func initFirstViewController(with data: FirstVCData) {
        navigationHandler.navigateToFirstViewController(with: data)
    }
    
}

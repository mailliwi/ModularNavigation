//
//  MainAssembler2.swift
//  MyInfrastructure

import MyBase
import UIKit

public final class MainAssembler2 {
    
    // MARK: - Properties
    //
    
    public nonisolated(unsafe) static let shared: MainAssembler2 = MainAssembler2()
    
    public var keychain: Keychain
    public var networkService: NetworkService
    
    // Should be init in the app's SceneDelegate
    // Review if force unwrapping has a better alternative
    public var navigator: Navigator!
    
    // MARK: - Initializers
    //
    
    private init() {
        let keychain = Keychain()
        self.keychain = keychain
        self.networkService = NetworkService(keychain: keychain)
    }
    
}

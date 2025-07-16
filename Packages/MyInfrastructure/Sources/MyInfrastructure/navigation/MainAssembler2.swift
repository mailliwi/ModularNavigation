//
//  MainAssembler2.swift
//  MyInfrastructure

import MyBase
import UIKit

public final class MainAssembler2 {
    
    // MARK: - Properties
    //
    
    public var keychain: Keychain
    public var networkService: NetworkService
    public var navigator: Navigator! // should be init in the app's SceneDelegate
    
    // MARK: - Initializers
    //
    
    public init() {
        let keychain = Keychain()
        self.keychain = keychain
        self.networkService = NetworkService(keychain: keychain)
    }
    
}

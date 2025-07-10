//
//  NetworkService.swift
//  MyInfrastructure

import Foundation

public struct NetworkService {
    
    public let keychain: Keychain
    
    public init(keychain: Keychain) {
        self.keychain = keychain
    }
    
    public func doSomeNetworking1() {
        // some networking where a value from Keychain is necessary
    }
    
    public func doSomeNetworking2() {
        // some networking where a value from Keychain is necessary
    }
    
    public func doSomeNetworking3() {
        // some networking where a value from Keychain is necessary
    }
    
}

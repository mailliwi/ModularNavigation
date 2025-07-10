//
//  Keychain.swift
//  MyInfrastructure

import Foundation

public final class Keychain {
    
    private let keychainValue1: String = "keychainValue1"
    private let keychainValue2: String = "keychainValue2"
    private let keychainValue3: String = "keychainValue3"
    
    public func fetchKeychainValue1() -> String? {
        return keychainValue1
    }
    
    public func fetchKeychainValue2() -> String? {
        return keychainValue2
    }
    
    public func fetchKeychainValue3() -> String? {
        return keychainValue3
    }
    
}

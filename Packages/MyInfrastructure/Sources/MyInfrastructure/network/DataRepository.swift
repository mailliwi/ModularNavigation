//
//  DataRepository.swift
//  MyInfrastructure

import Foundation

public struct DataRepository {
    
    public let keychain: Keychain
    public let networkService: NetworkService
    
    public init(keychain: Keychain, networkService: NetworkService) {
        self.keychain = keychain
        self.networkService = networkService
    }
    
    public func fetchSomething1() {
        networkService.doSomeNetworking1()
    }
    
    public func fetchSomething2() {
        networkService.doSomeNetworking2()
    }
    
    public func fetchSomething3() {
        networkService.doSomeNetworking3()
    }
    
}

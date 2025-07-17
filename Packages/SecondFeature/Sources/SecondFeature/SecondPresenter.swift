//
//  SecondPresenter.swift
//  Lite

import MyBase
import MyInfrastructure

public final class SecondPresenter {
    
    public let repository: DataRepository
    
    public init(repository: DataRepository) {
        self.repository = repository
    }
    
    public func someNetworkingLogic2(with string: String, and code: Int) {
        // not using arguments here because this is an MRE but could if needed
        repository.fetchSomething2()
    }
    
}

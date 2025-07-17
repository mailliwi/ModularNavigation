//
//  ThirdPresenter.swift
//  ThirdFeature

import MyBase
import MyInfrastructure

public final class ThirdPresenter {
    
    public let repository: DataRepository
    
    public init(repository: DataRepository) {
        self.repository = repository
    }
    
    public func someNetworkingLogic3(with string: String, and code: Int) {
        // not using arguments here because this is an MRE but could if needed
        repository.fetchSomething1()
    }
    
}

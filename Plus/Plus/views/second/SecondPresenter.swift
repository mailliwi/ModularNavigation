//
//  SecondPresenter.swift
//  Lite

import MyBase
import MyInfrastructure

public final class SecondPresenter: BasePresenter {
    
    public weak var view: BaseView?
    public let repository: DataRepository
    
    public init(view: BaseView, repository: DataRepository) {
        self.view = view
        self.repository = repository
    }
    
    public func someNetworkingLogic2(with string: String, and code: Int) {
        // not using arguments here because this is an MRE but could if needed
        repository.fetchSomething2()
    }
    
}

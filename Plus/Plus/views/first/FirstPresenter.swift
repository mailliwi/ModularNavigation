//
//  FirstPresenter.swift
//  Lite

import MyBase
import MyInfrastructure

public final class FirstPresenter: BasePresenter {    
    
    public weak var view: BaseView?
    public let repository: DataRepository
    
    public init(view: BaseView, repository: DataRepository) {
        self.view = view
        self.repository = repository
    }
    
    public func someNetworkingLogic1() {
        repository.fetchSomething1()
    }
    
}

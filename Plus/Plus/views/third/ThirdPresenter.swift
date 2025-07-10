//
//  ThirdPresenter.swift
//  Lite

import MyBase
import MyInfrastructure

public final class ThirdPresenter: BasePresenter {
    
    public weak var view: BaseView?
    public let repository: DataRepository
    
    public init(view: BaseView, repository: DataRepository) {
        self.view = view
        self.repository = repository
    }
    
    public func someNetworkingLogic3() {
        repository.fetchSomething3()
    }
    
}


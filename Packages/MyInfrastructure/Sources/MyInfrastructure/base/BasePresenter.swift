//
//  BasePresenter.swift
//  ISGInfrastructure

public protocol BasePresenter: AnyObject {
    
    var view: BaseView? { get set }
    func attach(toView view: BaseView)
    
}

public extension BasePresenter {
    
    func attach(toView view: BaseView) {
        self.view = view
    }
    
}

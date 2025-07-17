//
//  MainAssembler2+FirstFeature.swift
//  FirstFeature

import MyBase
import MyInfrastructure
import UIKit

@MainActor
extension MainAssembler2 {
    
    public func assembleFirstViewController(data: FirstVCData) -> UIViewController {
        let dataRepository = DataRepository(keychain: keychain, networkService: networkService)
        return FirstViewController(
            presenter: FirstPresenter(repository: dataRepository),
            firstVCData: data,
            navigator: navigator
        )
    }
    
}

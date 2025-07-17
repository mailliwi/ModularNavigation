//
//  MainAssembler2+SecondFeature.swift
//  SecondFeature

import MyBase
import MyInfrastructure
import UIKit

@MainActor
extension MainAssembler2 {
    
    public func assembleSecondViewController(data: SecondVCData) -> UIViewController {
        let dataRepository = DataRepository(keychain: keychain, networkService: networkService)
        return SecondViewController(
            presenter: SecondPresenter(repository: dataRepository),
            secondVCData: data,
            navigator: navigator
        )
    }
    
}

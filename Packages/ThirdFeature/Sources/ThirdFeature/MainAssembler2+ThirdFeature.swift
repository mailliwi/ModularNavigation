//
//  MainAssembler2+ThirdFeature.swift
//  ThirdFeature

import MyBase
import MyInfrastructure
import UIKit

extension MainAssembler2 {
    
    public func assembleThirdViewController(data: ThirdVCData) -> UIViewController {
        let dataRepository = DataRepository(keychain: keychain, networkService: networkService)
        return ThirdViewController(
            presenter: ThirdPresenter(repository: dataRepository),
            thirdVCData: data,
            navigator: navigator
        )
    }
    
}

//
//  Route.swift
//  MyInfrastructure

import MyBase
import UIKit

/// An exhaustive list of all the possible routes the app can navigate to.
/// A case should contain the data model needed for the ViewController to function properly, as an argument.
public enum Route {
    
    case login
    case firstVC(data: FirstVCData)
    case secondVC(data: SecondVCData)
    case thirdVC(data: ThirdVCData)
    
}

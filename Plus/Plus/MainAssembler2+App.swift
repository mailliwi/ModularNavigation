//
//  MainAssembler2+App.swift
//  Plus

import FirstFeature
import LoginFeature
import MyBase
import MyInfrastructure
import SecondFeature
import ThirdFeature
import UIKit

// ⚠️ Review usage of @retroactive here - see:
// - https://www.reddit.com/r/swift/comments/1ilg39m/does_anyone_know_what_retroactive_does_here/
// - https://forums.swift.org/t/retroactive-conformances-vs-swift-in-the-os/14393
// - https://stackoverflow.com/questions/79280086/what-happens-when-retroactive-conformance-actually-conflict-in-swift

/// This extension on MainAssembler2 will have to exist once per Project tier.
/// Meaning this is the only place where changes will have to be backported, unless a better solution is found.
extension MainAssembler2: @retroactive FeatureFactory {
    
    // MARK: - Navigation
    //
    
    public func makeFeature(for route: Route) -> UIViewController {
        switch route {
        case .login:
            return assembleLoginViewController()
            
        case .firstVC(let firstVCData):
            return assembleFirstViewController(data: firstVCData)
            
        case .secondVC(let secondVCdata):
            return assembleSecondViewController(data: secondVCdata)
            
        case .thirdVC(let thirdVCData):
            return assembleThirdViewController(data: thirdVCData)
        }
    }
    
}

//
//  MainAssembler.swift
//  MyInfrastructure

/// ⚠️
/// This class is a lightweight version of the original implementation.
/// It does not work, because this module has no access or knowledge about the VCs and presenters it's trying to assemble together.
/// It has been left in this project as a way to visualize/understand what the issue at hand is.
/// The rewrite attempt is in `MainAssembler2`
/// ⚠️

public final class MainAssembler: @unchecked Sendable {
    
    public static let shared = MainAssembler()
    
    public var keychain: Keychain
    public var networkService: NetworkService
    
    private init() {
        let keychainInstance = Keychain()
        self.keychain = keychainInstance
        self.networkService = NetworkService(keychain: keychainInstance)
    }
    
    // MARK: AccountViewController
    
    public func resolveFirstViewController() -> FirstViewController {
        let vc = FirstViewController()
        let repository = DataRepository(keychain: keychain, networkService: networkService)
        let presenter = FirstPresenter(view: vc,repository: repository)
        vc.presenter = presenter
        
        return vc
    }
    
    public func resolveSecondViewController() -> SecondViewController {
        let vc = SecondViewController()
        let repository = DataRepository(keychain: keychain, networkService: networkService)
        let presenter = SecondPresenter(view: vc,repository: repository)
        vc.presenter = presenter
        
        return vc
    }
    
    public func resolveThirdViewController() -> ThirdViewController {
        let vc = ThirdViewController()
        let repository = DataRepository(keychain: keychain, networkService: networkService)
        let presenter = ThirdPresenter(view: vc,repository: repository)
        vc.presenter = presenter
        
        return vc
    }
    
}

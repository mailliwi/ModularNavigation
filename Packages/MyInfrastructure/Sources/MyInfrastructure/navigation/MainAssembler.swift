//
//  MainAssembler.swift
//  MyInfrastructure

public final class MainAssembler: @unchecked Sendable {
    
    public static let shared = MainAssembler()
    public let navigationHandler: NavigationHandler = NavigationHandler()
    
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

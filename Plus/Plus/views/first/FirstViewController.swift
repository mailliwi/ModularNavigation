//
//  FirstViewController.swift
//  Lite

import MyBase
import MyInfrastructure
import UIKit

public final class FirstViewController: BaseViewController {
    
    // MARK: - Properties
    //
    
    private let presenter: FirstPresenter?
    private let firstVCData: FirstVCData?
    private let navigator: Navigator
    
    // MARK: - Initializers
    //
    
    public init(
        presenter: FirstPresenter?,
        firstVCData: FirstVCData?,
        navigator: Navigator
    ) {
        self.presenter = presenter
        self.firstVCData = firstVCData
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    //
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    // MARK: - Functions
    //
    
    private func setupData() {
        if let _ = firstVCData?.title {
            // do something with title
        }
        
        if let _ = firstVCData?.code {
            // do something with code
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemGray6
        
        let label = setupLabel()
        let presenterButton = setupPresenterButton()
        let vc2NavigationButton = setupVC2NavigationButton()
        let vc3NavigationButton = setupVC3NavigationButton()
        let logOutButton = setupLogOutButton()
        
        let stackView = UIStackView(
            arrangedSubviews: [
                label,
                presenterButton,
                vc2NavigationButton,
                vc3NavigationButton,
                logOutButton
            ]
        )
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Label
    //
    
    private func setupLabel() -> UILabel {
        let label = UILabel()
        label.text = "First View Controller"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }
    
    // MARK: - Presenter Button
    //
    
    private func setupPresenterButton() -> UIButton {
        let button = UIButton(configuration: .filled())
        button.configuration?.baseBackgroundColor = .systemBlue
        button.setTitle("Execute First Presenter Logic", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(
            self,
            action: #selector(didTapFirstPresenterButton),
            for: .touchUpInside
        )
        
        return button
    }
    
    @objc private func didTapFirstPresenterButton() {
        presenter?.someNetworkingLogic1(
            with: firstVCData?.title ?? "",
            and: firstVCData?.code ?? 0
        )
    }
    
    // MARK: - Navigate to VC2 Button
    //
    
    private func setupVC2NavigationButton() -> UIButton {
        let button = UIButton(configuration: .filled())
        button.configuration?.baseBackgroundColor = .systemBlue
        button.setTitle("Navigate to VC2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(
            self,
            action: #selector(didTapNavigateToVC2Button),
            for: .touchUpInside
        )
        
        return button
    }
    
    @objc private func didTapNavigateToVC2Button() {
        let someSecondVCData: SecondVCData = SecondVCData(title: "Hello there", code: 123)
        navigator.navigate(to: .secondVC(data: someSecondVCData), presentationStyle: .push())
    }
    
    // MARK: - Navigate to VC3 Button
    //
    
    private func setupVC3NavigationButton() -> UIButton {
        let button = UIButton(configuration: .filled())
        button.configuration?.baseBackgroundColor = .systemBlue
        button.setTitle("Navigate to VC3", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(
            self,
            action: #selector(didTapNavigateToVC3Button),
            for: .touchUpInside
        )
        
        return button
    }
    
    @objc private func didTapNavigateToVC3Button() {
        let someThirdVCData: ThirdVCData = ThirdVCData(title: "Hello there", code: 123)
        navigator.navigate(to: .thirdVC(data: someThirdVCData), presentationStyle: .present())
    }
    
    // MARK: - Log Out Button
    //
    
    private func setupLogOutButton() -> UIButton {
        let button = UIButton(configuration: .bordered())
        button.configuration?.baseBackgroundColor = .systemBlue
        button.setTitle("Log out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(
            self,
            action: #selector(didTapLogOutButton),
            for: .touchUpInside
        )
        
        return button
    }
    
    @objc private func didTapLogOutButton() {
        navigator.popToRoot()
    }
    
}

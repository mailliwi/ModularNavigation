//
//  LoginViewController.swift
//  LoginFeature

import MyBase
import MyInfrastructure
import UIKit

public final class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    //
    
    private let navigator: Navigator
    
    // MARK: - Initializers
    //
    
    public init(navigator: Navigator) {
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
        setupUI()
    }
    
    // MARK: - Functions
    //
    
    private func setupUI() {
        view.backgroundColor = .systemYellow
        
        let label = setupLabel()
        let vc1NavigationButton = setupLoginButton()
        
        let stackView = UIStackView(
            arrangedSubviews: [
                label,
                vc1NavigationButton
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
        label.text = "Login View Controller"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }
    
    // MARK: - Navigate to VC1 Button
    //
    
    private func setupLoginButton() -> UIButton {
        let button = UIButton(configuration: .filled())
        button.configuration?.baseBackgroundColor = .systemBlue
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(
            self,
            action: #selector(didTapLoginButton),
            for: .touchUpInside
        )
        
        return button
    }
    
    @objc private func didTapLoginButton() {
        let someFirstVCData: FirstVCData = FirstVCData(title: "Hello there", code: 123)
        navigator.navigate(to: .firstVC(data: someFirstVCData), presentationStyle: .push(hideBackButton: true))
    }
    
}

//
//  LoginViewController.swift
//  Lite

import MyInfrastructure
import UIKit

class LoginViewController: BaseViewController {
    
    // MARK: - Lifecycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Functions
    //
    
    private func setupUI() {
        view.backgroundColor = .systemYellow
        
        let label = setupLabel()
        let vc1NavigationButton = setupVC1NavigationButton()
        
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
    
    private func setupVC1NavigationButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(
            self,
            action: #selector(didTapNavigateToVC1Button),
            for: .touchUpInside
        )
        
        return button
    }
    
    @objc private func didTapNavigateToVC1Button() {
        // figure out what to do here
    }
    
}

//
//  SecondViewController.swift
//  Lite

import MyBase
import MyInfrastructure
import UIKit

final class SecondViewController: BaseViewController {
    
    // MARK: - Properties
    //
    
    private let presenter: SecondPresenter?
    private let secondVCData: SecondVCData?
    
    // MARK: - Initializers
    //
    
    public init(
        presenter: SecondPresenter?,
        secondVCData: SecondVCData?
    ) {
        self.presenter = presenter
        self.secondVCData = secondVCData
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    // MARK: - Functions
    //
    
    private func setupData() {
        if let _ = secondVCData?.title {
            // do something with title
        }
        
        if let _ = secondVCData?.code {
            // do something with code
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemPink
        
        let label = setupLabel()
        let presenterButton = setupSecondPresenterButton()
        let vc1NavigationButton = setupVC1NavigationButton()
        let vc3NavigationButton = setupVC3NavigationButton()
        
        let stackView = UIStackView(
            arrangedSubviews: [
                label,
                presenterButton,
                vc1NavigationButton,
                vc3NavigationButton
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
        label.text = "Second View Controller"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }
    
    // MARK: - Presenter Button
    //
    
    private func setupSecondPresenterButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Execute Second Presenter Logic", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(
            self,
            action: #selector(didTapSecondPresenterButton),
            for: .touchUpInside
        )
        
        return button
    }
    
    @objc private func didTapSecondPresenterButton() {
        presenter?.someNetworkingLogic2(
            with: secondVCData?.title ?? "",
            and: secondVCData?.code ?? 0
        )
    }
    
    // MARK: - Navigate to VC1 Button
    //
    
    private func setupVC1NavigationButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Navigate to VC1", for: .normal)
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
    
    // MARK: - Navigate to VC3 Button
    //
    
    private func setupVC3NavigationButton() -> UIButton {
        let button = UIButton(type: .system)
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
        // figure out what to do here
    }
    
}

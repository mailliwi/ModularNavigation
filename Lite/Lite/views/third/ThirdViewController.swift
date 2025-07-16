//
//  ThirdViewController.swift
//  Lite

import MyBase
import MyInfrastructure
import UIKit

final class ThirdViewController: BaseViewController {
    
    // MARK: - Properties
    //
    
    private let presenter: ThirdPresenter?
    private let thirdVCData: ThirdVCData?
    
    // MARK: - Initializers
    //
    
    public init(
        presenter: ThirdPresenter?,
        thirdVCData: ThirdVCData?
    ) {
        self.presenter = presenter
        self.thirdVCData = thirdVCData
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
        if let _ = thirdVCData?.title {
            // do something with title
        }
        
        if let _ = thirdVCData?.code {
            // do something with code
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemGreen
        
        let label = setupLabel()
        let presenterButton = setupThirdPresenterButton()
        let vc1NavigationButton = setupVC1NavigationButton()
        let vc2NavigationButton = setupVC2NavigationButton()
        
        let stackView = UIStackView(
            arrangedSubviews: [
                label,
                presenterButton,
                vc1NavigationButton,
                vc2NavigationButton
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
        label.text = "Third View Controller"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }
    
    // MARK: - Presenter Button
    //
    
    private func setupThirdPresenterButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Execute Third Presenter Logic", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(
            self,
            action: #selector(didTapThirdPresenterButton),
            for: .touchUpInside
        )
        
        return button
    }
    
    @objc private func didTapThirdPresenterButton() {
        presenter?.someNetworkingLogic3(
            with: thirdVCData?.title ?? "",
            and: thirdVCData?.code ?? 0
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
    
    // MARK: - Navigate to VC2 Button
    //
    
    private func setupVC2NavigationButton() -> UIButton {
        let button = UIButton(type: .system)
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
        // figure out what to do here
    }
    
}

//
//  FirstViewController.swift
//  Lite

import MyBase
import MyInfrastructure
import UIKit

final class FirstViewController: BaseViewController {
    
    // MARK: - Properties
    //
    
    private let presenter: FirstPresenter?
    private let firstVCData: FirstVCData?
    
    // MARK: - Initializers
    //
    
    public init(
        presenter: FirstPresenter?,
        firstVCData: FirstVCData?
    ) {
        self.presenter = presenter
        self.firstVCData = firstVCData
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
        if let _ = firstVCData?.title {
            // do something with title
        }
        
        if let _ = firstVCData?.code {
            // do something with code
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBlue
        
        let label = setupLabel()
        let presenterButton = setupPresenterButton()
        let vc2NavigationButton = setupVC2NavigationButton()
        let vc3NavigationButton = setupVC3NavigationButton()
        
        let stackView = UIStackView(
            arrangedSubviews: [
                label,
                presenterButton,
                vc2NavigationButton,
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
        label.text = "First View Controller"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }
    
    // MARK: - Presenter Button
    //
    
    private func setupPresenterButton() -> UIButton {
        let button = UIButton(type: .system)
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

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
        
        let label = UILabel()
        label.text = "Second View Controller"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let button = UIButton(type: .system)
        button.setTitle("Exec logic 2 from presenter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(
            self,
            action: #selector(didTapButton),
            for: .touchUpInside
        )
        
        let stackView = UIStackView(arrangedSubviews: [label, button])
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
    
    @objc private func didTapButton() {
        presenter?.someNetworkingLogic2(
            with: secondVCData?.title ?? "",
            and: secondVCData?.code ?? 0
        )
    }
    
}

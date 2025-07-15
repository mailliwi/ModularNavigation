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
        
        let label = UILabel()
        label.text = "First View Controller"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        let button = UIButton(type: .system)
        button.setTitle("Exec logic 1 from presenter", for: .normal)
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
        presenter?.someNetworkingLogic1(
            with: firstVCData?.title ?? "",
            and: firstVCData?.code ?? 0
        )
    }
    
}

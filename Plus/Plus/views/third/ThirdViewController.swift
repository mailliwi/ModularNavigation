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
        view.backgroundColor = .systemYellow
        
        let label = UILabel()
        label.text = "Third View Controller"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let button = UIButton(type: .system)
        button.setTitle("Exec logic 3 from presenter", for: .normal)
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
        presenter?.someNetworkingLogic3(
            with: thirdVCData?.title ?? "",
            and: thirdVCData?.code ?? 0
        )
    }
    
}

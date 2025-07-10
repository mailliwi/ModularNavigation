//
//  SecondViewController.swift
//  Lite

import MyBase
import MyInfrastructure
import UIKit

final class SecondViewController: BaseViewController {
    
    private var presenter: SecondPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController() {
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
        presenter?.someNetworkingLogic2()
    }
    
}

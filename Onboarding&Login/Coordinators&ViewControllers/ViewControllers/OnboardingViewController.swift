//
//  OnboardingViewController.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

final class OnboardingViewController: UIViewController, CoordinatableViewController {
    
    var coordinator: Coordinator!
            
    // MARK: - Properties
    
    private lazy var label: UILabel = {
        makeLabel(text: "Onboarding", font: .systemFont(ofSize: 32), addTo: view)
    }()
    
    private lazy var button: UIButton = {
        makeButton(type: .system, title: "to Login", font: .systemFont(ofSize: 20), addTo: view)
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        DispatchQueue.main.async {
            self.setupViews()
            self.setupTargets()
        }
    }
    
    func setupViews() {
        view.backgroundColor = .green
        button.backgroundColor = .blue
        
        button.layer.cornerRadius = button.frame.height / 2

        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 50).isActive = true
    }
    
    func setupTargets() {
        button.addTarget(self, action: #selector(toLoginButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Targets
    
    @objc func toLoginButtonPressed(_ sender: UIButton) {
        coordinator.show(coordinator.viewControllers[0])
    }
    
}


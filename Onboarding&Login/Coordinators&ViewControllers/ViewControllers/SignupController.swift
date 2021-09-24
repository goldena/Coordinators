//
//  RegisterViewController.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

final class SignupController: UIViewController, CoordinatableViewController {
    
    var coordinator: Coordinator!
            
    // MARK: - Properties
    
    private lazy var label: UILabel = {
        makeLabel(text: "Signup", font: .systemFont(ofSize: 32), addTo: view)
    }()
    
    private lazy var button: UIButton = {
        makeButton(type: .system, title: "to Login", font: .systemFont(ofSize: 20), addTo: view)
    }()
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .gray

        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #warning("Solve issue with frame and bounds being 0 at this point")
        
        self.setupViews()
        self.setupTargets()
    }
    
    func setupViews() {
        button.backgroundColor = .blue
        
        button.layer.cornerRadius = button.frame.height / 2

        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate()
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).activate()
        
        button.heightAnchor.constraint(equalToConstant: 50).activate()
        button.widthAnchor.constraint(equalToConstant: 100).activate()
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate()
        button.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 50).activate()
    }
    
    func setupTargets() {
        button.addTarget(self, action: #selector(toLoginButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Targets
    
    @objc func toLoginButtonPressed(_ sender: UIButton) {
        coordinator.show(coordinator.viewControllers[0])
    }
    
}

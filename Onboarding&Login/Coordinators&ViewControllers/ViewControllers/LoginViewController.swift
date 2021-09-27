//
//  LoginViewController.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

final class LoginViewController: CoordinatableViewControllerWithCustomView {
    
    // MARK: - Properties
    
    var loginView: LoginView {
        guard let loginView = view as? LoginView else {
            fatalError("Wrong CustomView type \(ViewType) passed to the controller \(self)")
        }
        
        return loginView
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     
    // MARK: - Targets
    
    override func setupTargets() {
        super.setupTargets()
        
        loginView.button.addTarget(self, action: #selector(toLoginButtonPressed), for: .touchUpInside)
    }

    @objc func toLoginButtonPressed(_ sender: UIButton) {
        coordinator.show(viewControllerType: LoginViewController.self)
    }

}

//
//  RegisterViewController.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

final class SignupController: CoordinatableViewControllerWithCustomView {
    
    // MARK: - Properties
    
    var signupView: SignupView {
        guard let signupView = view as? SignupView else {
            fatalError("Wrong CustomView type \(CustomViewSubtype) passed to the controller \(self)")
        }
        
        return signupView
    }
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Targets
    
    override func setupTargets() {
        super.setupTargets()
        
        signupView.button.addTarget(self, action: #selector(toLoginButtonPressed), for: .touchUpInside)
    }
    
    @objc func toLoginButtonPressed(_ sender: UIButton) {
        coordinator.show(coordinator.viewControllers[0])
    }
    
}

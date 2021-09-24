//
//  RegisterViewController.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

final class SignupController: UIViewController, CoordinatableViewController {
                
    // MARK: - Properties
    
    var coordinator: Coordinator!

    var signupView: SignupView {
        view as! SignupView
    }
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        let signupView = SignupView()

        self.view = signupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupTargets()
    }
        
    func setupTargets() {
        signupView.button.addTarget(self, action: #selector(toLoginButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Targets
    
    @objc func toLoginButtonPressed(_ sender: UIButton) {
        coordinator.show(coordinator.viewControllers[0])
    }
    
}

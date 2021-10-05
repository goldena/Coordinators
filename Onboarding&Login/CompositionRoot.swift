//
//  Composer.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 27.09.21.
//

import UIKit

protocol CompositionRootDelegate: AnyObject {
    
    // func didSelectUser(_ sender: Any, user: User)
    func coordinatorDidChange(_ sender: Any)
    
}

final class CompositionRoot {
    
    static var signupViewController = SignupController(customView: SignupView())

    static let shared = CompositionRoot()
    
    static var loginFlowCoordinator: Coordinator?
    static var mainFlowCoordinator: Coordinator?
    
    weak var delegate: CompositionRootDelegate?
    
    var currentCoordinator: Coordinator? {
        if Self.loginFlowCoordinator != nil { return Self.loginFlowCoordinator }
        if Self.mainFlowCoordinator != nil { return Self.mainFlowCoordinator }
        
        return nil
    }
    
    func changeCoordinator(from: inout Coordinator?, to: Coordinator?) {
        delegate?.coordinatorDidChange(self)
        
        Self.mainFlowCoordinator = Coordinator(compositionRoot: self, rootViewController: CompositionRoot.signupViewController)
        
        from?.viewControllers = []
        from?.rootViewController = nil
        
        from = nil
    }
    
    private init() {
        let page1 = UIViewController()
        let page2 = UIViewController()
        let page3 = UIViewController()
        
        page1.view.backgroundColor = .blue
        page2.view.backgroundColor = .yellow
        page3.view.backgroundColor = .gray

        lazy var onboardingViewController = OnboardingViewController(pages: page1, page2, page3)
        
        lazy var loginViewController = LoginViewController(customView: LoginView())
        lazy var tableViewController = TableViewController(customView: TableView())

        Self.loginFlowCoordinator = Coordinator(compositionRoot: self, rootViewController: tableViewController, otherViewControllers: loginViewController)
        //
    }
    
}

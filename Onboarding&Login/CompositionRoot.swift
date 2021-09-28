//
//  Composer.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 27.09.21.
//

import UIKit

protocol CompositionRootDelegate: AnyObject {
    
    func coordinatorDidChange(_ sender: Any)
    
}

final class CompositionRoot {
    
    static let shared = CompositionRoot()
    
    static var loginCoordinator: Coordinator?
    static var mainCoordinator: Coordinator?
    
    weak var delegate: CompositionRootDelegate?
    
    var currentCoordinator: Coordinator? {
        if Self.loginCoordinator != nil { return Self.loginCoordinator }
        if Self.mainCoordinator != nil { return Self.mainCoordinator }
        
        return nil
    }
    
    func changeCoordinator(from: inout Coordinator?, to: Coordinator?) {
        delegate?.coordinatorDidChange(self)
        
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
        
        lazy var signupViewController = SignupController(customView: SignupView())
        lazy var loginViewController = LoginViewController(customView: LoginView())
        lazy var tableViewController = TableViewController(customView: TableView())

        Self.loginCoordinator = Coordinator(compositionRoot: self, rootViewController: tableViewController, otherViewControllers: loginViewController)
        Self.mainCoordinator = Coordinator(compositionRoot: self, rootViewController: signupViewController)
    }
    
}

//
//  Coordinator.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

class Coordinator {
    
    // MARK: - Properties
    
    private(set) var viewControllers: [CoordinatableViewController] = []
    let rootViewController: CoordinatableViewController
    
    // MARK: - Methods
    
    func show(_ viewController: CoordinatableViewController) {
        // viewController.modalPresentationStyle = .popover
        // viewController.modalTransitionStyle = .partialCurl
        
        rootViewController.show(viewController as UIViewController, sender: self)
    }
    
    // MARK: - Init
    
    init(root: CoordinatableViewController, controllers: CoordinatableViewController...) {
        self.rootViewController = root
        root.coordinator = self
        
        self.viewControllers.append(contentsOf: controllers)
        print(self.viewControllers)
        controllers.forEach { $0.coordinator = self }
    }
    
}


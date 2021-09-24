//
//  Coordinator.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

class Coordinator {
    
    // MARK: - Properties
    
    private(set) var viewControllers: [CoordinatableUIViewController] = []
    let rootViewController: CoordinatableUIViewController
    
    // MARK: - Methods
    
    func show(_ viewController: CoordinatableUIViewController) {
        // viewController.modalPresentationStyle = .popover
        // viewController.modalTransitionStyle = .partialCurl
        
        rootViewController.show(viewController, sender: self)
    }
    
    // MARK: - Init
    
    init(root: CoordinatableUIViewController, controllers: CoordinatableUIViewController...) {
        self.rootViewController = root
        root.coordinator = self
        
        self.viewControllers.append(contentsOf: controllers)
        print(self.viewControllers)
        controllers.forEach { $0.coordinator = self }
    }
    
}


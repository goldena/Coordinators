//
//  Coordinator.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 23.09.21.
//

import UIKit

class Coordinator {
    
    // MARK: - Properties
    
    private(set) var viewControllers: [CoordinatableViewControllerWithCustomView] = []
    let rootViewController: CoordinatableViewControllerWithCustomView
    
    // MARK: - Methods
    
    func show(_ viewController: CoordinatableViewControllerWithCustomView) {
        rootViewController.show(viewController as UIViewController, sender: self)
    }
    
    // MARK: - Init
    
    init(rootViewController: CoordinatableViewControllerWithCustomView, otherViewControllers: CoordinatableViewControllerWithCustomView...) {
        self.rootViewController = rootViewController
        self.viewControllers.append(contentsOf: otherViewControllers)
        
        rootViewController.coordinator = self
        otherViewControllers.forEach { $0.coordinator = self }
    }
    
}


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
    
    func show(viewControllerType: AnyClass? = nil, tag: String? = nil) {
        // Trying to show a ViewController with a unique tag, if it fails show ViewController of a particular type
        if let tag = tag {
            let viewControllersWithTheSameTag = viewControllers.filter { $0.tag == tag }
            
            if viewControllersWithTheSameTag.count == 1 {
                rootViewController.show(viewControllersWithTheSameTag[0], sender: self)
                return
            } else {
                fatalError("\(viewControllersWithTheSameTag.count) ViewControllers with the same tag \(tag)")
            }
        }
            
        for controller in viewControllers {
            if type(of: controller) === viewControllerType {
                rootViewController.show(controller as UIViewController, sender: self)
            }
        }
    }
    
    // MARK: - Init
    
    init(rootViewController: CoordinatableViewControllerWithCustomView, otherViewControllers: CoordinatableViewControllerWithCustomView...) {
        self.rootViewController = rootViewController
        self.viewControllers.append(contentsOf: otherViewControllers)
        
        rootViewController.coordinator = self
        otherViewControllers.forEach { $0.coordinator = self }
    }
    
}


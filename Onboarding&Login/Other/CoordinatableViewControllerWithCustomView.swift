//
//  ViewControllerWithCustomViewViewController.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 27.09.21.
//

import UIKit

class CoordinatableViewControllerWithCustomView: UIViewController {

    // MARK: - Properties
    
    var coordinator: Coordinator?
    
    var customView: CustomView
    
    // Optional tag for cases when there is more than one instance of the same ViewController type
    var tag: String?
        
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupTargets()
    }
        
    // MARK: - Targets
    
    func setupTargets() {}

    // MARK: - Initializers
    
    init(customView: CustomView) {
        self.customView = customView

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        #if DEBUG
            print("\(self) deinitialized")
        #endif
    }
}

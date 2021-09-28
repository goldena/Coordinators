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
    
    // Optional tag for cases when there is more than one instance of the same ViewController type
    var tag: String?
    
    // Used for instantiating of a particular Custom View Type injected into the ViewController
    var ViewType: CustomView.Type
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = ViewType.init(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupTargets()
    }
        
    // MARK: - Targets
    
    func setupTargets() {}

    // MARK: - Initializers
    
    init(ViewType: CustomView.Type) {
        print(ViewType)
        
        self.ViewType = ViewType

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

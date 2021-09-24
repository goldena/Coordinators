//
//  Coordinatable.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 24.09.21.
//

import UIKit

protocol CoordinatableViewController: UIViewController {
    
    var coordinator: Coordinator! { get set }
    
}

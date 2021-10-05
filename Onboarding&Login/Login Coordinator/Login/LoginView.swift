//
//  LoginView.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 27.09.21.
//

import UIKit

class LoginView: CustomView {

    // MARK: - Properties
    
    lazy var label: UILabel = {
        UILabel(text: "Login", font: .systemFont(ofSize: 32), addTo: self)
    }()
    
    lazy var button: UIButton = {
        UIButton(type: .system, title: "to Signup", font: .systemFont(ofSize: 20), addTo: self)
    }()
    
    // MARK: - View Lifecycle
    
    override func setupView() {
        backgroundColor = .darkGray

        button.backgroundColor = .blue
    }
    
    override func setupLayout() {
        label.centerXY()
        
        button.sizeXY(width: 100, height: 50)
        
        button.centerX()
        button.centerY(offset: 50)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.layer.cornerRadius = button.frame.height / 2
    }
}

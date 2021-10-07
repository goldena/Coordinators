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
        label.centerXY() // Centers label in superview
        
        button.sizeXY(width: 100, height: 50)
        
        let constraint = label.sizeX(equalTo: button)
        constraint.deactivate()
        
        button.centerX() // Centers horizontally in superview
        button.centerY(with: .anchor(label.centerYAnchor)).offset(50)
        
        label.fillX(padding: 20) // Fill superview with padding of 20
        
        button.huggingX = .defaultHigh
        label.compressionX = .defaultLow
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.layer.cornerRadius = button.frame.height / 2
    }
}

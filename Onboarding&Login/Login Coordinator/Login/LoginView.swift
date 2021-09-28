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
        makeLabel(text: "Login", font: .systemFont(ofSize: 32), addTo: self)
    }()
    
    lazy var button: UIButton = {
        makeButton(type: .system, title: "to Signup", font: .systemFont(ofSize: 20), addTo: self)
    }()
    
    // MARK: - View Lifecycle
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .darkGray

        button.backgroundColor = .blue
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
        label.centerYAnchor.constraint(equalTo: centerYAnchor).activate()

        button.heightAnchor.constraint(equalToConstant: 50).activate()
        button.widthAnchor.constraint(equalToConstant: 100).activate()

        button.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
        button.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 50).activate()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        button.layer.cornerRadius = button.frame.height / 2
    }
}

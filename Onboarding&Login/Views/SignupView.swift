//
//  SignupView.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 24.09.21.
//

import UIKit

final class SignupView: CustomView {

    // MARK: - Properties
        
    lazy var label: UILabel = {
        makeLabel(text: "Signup", font: .systemFont(ofSize: 32), addTo: self)
    }()
    
    lazy var button: UIButton = {
        makeButton(type: .system, title: "to Signup", font: .systemFont(ofSize: 20), addTo: self)
    }()

    // MARK: - View Lifecycle
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .gray

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
    
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//
//        self.button.layer.cornerRadius = self.button.frame.height / 2
//    }
  
    override func layoutSubviews() {
        super.layoutSubviews()
        
        print("layoutSubviews")
        
        button.layer.cornerRadius = button.frame.height / 2
    }
    
}

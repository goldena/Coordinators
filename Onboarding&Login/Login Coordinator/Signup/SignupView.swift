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
        UILabel(text: "Signup", font: .systemFont(ofSize: 32), addTo: self)
    }()
    
    lazy var button: UIButton = {
        UIButton(type: .system, title: "to Login", font: .systemFont(ofSize: 20), addTo: self)
    }()

    // MARK: - View Lifecycle
    
    override func setupView() {
        backgroundColor = .gray

        button.backgroundColor = .blue
    }
    
    override func setupLayout() {
        label.centerXY()
        
        button.sizeX(100)
        button.sizeY(50)

        button.centerX()
        button.centerY().offset(50)
    }
  
    override func layoutSubviews() {
        super.layoutSubviews()
         
        button.layer.cornerRadius = button.frame.height / 2
    }
    
}

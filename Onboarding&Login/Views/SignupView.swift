//
//  SignupView.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 24.09.21.
//

import UIKit

final class SignupView: UIView {

    // MARK: - Properties
        
    private lazy var label: UILabel = {
        makeLabel(text: "Signup", font: .systemFont(ofSize: 32), addTo: self)
    }()
    
    lazy var button: UIButton = {
        makeButton(type: .system, title: "to Login", font: .systemFont(ofSize: 20), addTo: self)
    }()

    // MARK: - View Lifecycle
    
    private func setupViews() {
        backgroundColor = .gray
        
        button.backgroundColor = .blue
        
        #warning("Solve issue with frame and bounds being 0 at this point")
        DispatchQueue.main.async {
            self.button.layer.cornerRadius = self.button.frame.height / 2
        }
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
        label.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        
        button.heightAnchor.constraint(equalToConstant: 50).activate()
        button.widthAnchor.constraint(equalToConstant: 100).activate()
        
        button.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
        button.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 50).activate()
    }

    // MARK: - Controls
    
//    private func setupControls() {
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//    }
//    
//    @objc private func buttonPressed(_ sender: UIButton) {
//        print("Button")
//    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        // setupControls()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

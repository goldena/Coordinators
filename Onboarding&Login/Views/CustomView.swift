//
//  CustomView.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 27.09.21.
//

import UIKit

class CustomView: UIView {
    
    // MARK: - View Lifecycle
    
    func setupViews() {}
    func setupLayout() {}
    func render() {}
    
    // MARK: - Init
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayout()
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

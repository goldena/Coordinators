//
//  UITextField+Extensions.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UITextField {
    
    convenience init(placeholder: String? = nil, font: UIFont? = nil, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        self.font = font
        
        addTo?.addSubview(self)
    }
    
}

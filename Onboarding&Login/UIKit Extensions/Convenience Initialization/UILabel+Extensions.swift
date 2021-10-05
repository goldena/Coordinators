//
//  UILabel+Extension.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UILabel {
    
    convenience init(text: String? = nil, font: UIFont? = nil, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.text = text
        self.font = font
        
        addTo?.addSubview(self)
    }
    
}

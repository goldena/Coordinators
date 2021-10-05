//
//  UIView.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UIView {
    
    convenience init(addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addTo?.addSubview(self)
    }
    
}

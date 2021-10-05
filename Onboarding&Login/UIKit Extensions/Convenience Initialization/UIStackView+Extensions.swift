//
//  UIStackView+Extensions.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis? = nil, distribution: UIStackView.Distribution? = nil, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis ?? .horizontal
        self.distribution = distribution ?? .equalCentering
        
        addTo?.addSubview(self)
    }
    
}

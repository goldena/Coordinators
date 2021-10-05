//
//  NSLayoutConstraint+Extensions.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension NSLayoutConstraint {

    @discardableResult
    func activate() -> NSLayoutConstraint {
        isActive = true

        return self
    }
    
    @discardableResult
    func deactivate() -> NSLayoutConstraint {
        isActive = false

        return self
    }

    @discardableResult
    func padding(_ padding: CGFloat) -> NSLayoutConstraint {
        self.constant = padding

        return self
    }
    
    @discardableResult
    func offset(_ offset: CGFloat) -> NSLayoutConstraint {
        print(self.description)
        
        self.constant = offset

        return self
    }
    
}

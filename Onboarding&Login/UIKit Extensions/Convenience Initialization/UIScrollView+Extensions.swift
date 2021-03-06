//
//  UIScrollView+Extensions.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UIScrollView {
    
    convenience init(size: CGSize? = nil, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentSize = CGSize(width: size?.width ?? 0, height: size?.height ?? 0)
        
        addTo?.addSubview(self)
    }
    
}

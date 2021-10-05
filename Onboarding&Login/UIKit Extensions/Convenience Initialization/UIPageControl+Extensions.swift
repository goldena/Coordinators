//
//  UIPageControl+Extensions.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

public extension UIPageControl {
    
    convenience init(numberOfPages: Int, currentPage: Int = 0, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfPages = numberOfPages
        self.currentPage = 0
        
        addTo?.addSubview(self)
    }
    
}

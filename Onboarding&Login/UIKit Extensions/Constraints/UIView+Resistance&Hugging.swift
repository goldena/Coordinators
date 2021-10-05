//
//  UIView+Extensions(Resistance&Hugging).swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

// MARK: - Setting compression resistance

extension UIView {
    
    func resistanceX(_ priority: UILayoutPriority) -> UIView {
        setContentCompressionResistancePriority(priority, for: .horizontal)
        
        return self
    }
    
    func resistanceY(_ priority: UILayoutPriority) -> UIView {
        setContentCompressionResistancePriority(priority, for: .vertical)
        
        return self
    }
    
    func resistanceXY(_ priority: UILayoutPriority) -> UIView {
        resistanceX(priority).resistanceY(priority)
    }
    
}

// MARK: - Setting content hugging

extension UIView {
    
    func huggingX(_ priority: UILayoutPriority) -> UIView {
        setContentHuggingPriority(priority, for: .horizontal)
        
        return self
    }
    
    func huggingY(_ priority: UILayoutPriority) -> UIView {
        setContentHuggingPriority(priority, for: .vertical)
        
        return self
    }
    
    func huggingXY(_ priority: UILayoutPriority) -> UIView {
        huggingX(priority).huggingY(priority)
    }
    
}

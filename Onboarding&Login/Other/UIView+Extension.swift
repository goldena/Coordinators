//
//  UIView+Extension.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

// Debugging flag to set background colors?

// MARK: - Snapping to edges


// MARK: - Size constraints - Constant

public extension UIView {
    
    func sizeX(_ width: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).activate()
    }
    
    func sizeY(_ height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).activate()
    }
    
    func sizeXY(width: CGFloat, height: CGFloat) {
        sizeX(width)
        sizeY(height)
    }
    
}

// MARK: - Size constraints relative to another view or optional part of it

public extension UIView {
    
    func sizeX(equalTo view: UIView, part: CGFloat = 1) {
        widthAnchor.constraint(equalTo: view.widthAnchor).activate()
    }
    
    func sizeY(equalTo view: UIView, part: CGFloat = 1) {
        heightAnchor.constraint(equalTo: view.heightAnchor).activate()
    }
    
    func sizeXY(equalTo view: UIView, part: CGFloat = 1) {
        sizeX(equalTo: view, part: part)
        sizeY(equalTo: view, part: part)
    }
    
}

// MARK: - Centring in a superview with an optional offset

public extension UIView {
    
    func centerX(offset: CGFloat = 0) {
        guard let superview = superview else {
            NSLog("No superview to center horizontally in")
            return
        }
        
        centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: offset).activate()
    }
    
    func centerY(offset: CGFloat = 0) {
        guard let superview = superview else {
            NSLog("No superview to center vertically in")
            return
        }
        
        centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset).activate()
    }
    
    func centerXY(offset: CGFloat = 0) {
        centerX(offset: offset)
        centerY(offset: offset)
    }

}

// MARK: - Aligning with another view with an optional offset

public extension UIView {
    
    func alignX(with view: UIView, offset: CGFloat = 0) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset).activate()
    }
    
    func alignY(with view: UIView, offset: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset).activate()
    }

    func alignXY(with view: UIView) {
        alignX(with: view)
        alignY(with: view)
    }
    
}

public enum EdgeConstraintX {
    
    case toBounds(padding: CGFloat = 0)
    case toSafeArea(padding: CGFloat = 0)
    case toMargins(padding: CGFloat = 0)
    case toAnchor(NSLayoutAnchor<NSLayoutXAxisAnchor>, padding: CGFloat = 0)
    
    func withPadding(_ padding: CGFloat) {
        
    }
    
}

public enum EdgeConstraintY {
    
    case toBounds(padding: CGFloat = 0)
    case toSafeArea(padding: CGFloat = 0)
    case toMargins(padding: CGFloat = 0)
    case toAnchor(NSLayoutAnchor<NSLayoutYAxisAnchor>, padding: CGFloat = 0)
    
}

public extension UIView {
        
    func leading(_ constraint: EdgeConstraintX) -> UIView {
        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint leading edge")
            return self
        }
        
        switch constraint {
        case .toBounds(let padding):
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding).activate()
            
        case .toSafeArea(let padding):
            leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: padding).activate()
            
        case .toMargins(let padding):
            let leadingMargin = superview.directionalLayoutMargins.leading
            
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leadingMargin + padding).activate()
            
        case .toAnchor(let anchor, padding: let padding):
            leadingAnchor.constraint(equalTo: anchor, constant: padding).activate()
        }
        
        return self
    }
    
    func trailing(_ constraint: EdgeConstraintX) {
        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint trailing edge")
            return
        }
        
        switch constraint {
        case .toBounds(let padding):
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: padding).activate()
            
        case .toSafeArea(let padding):
            trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: padding).activate()
            
        case .toMargins(let padding):
            let trailingMargin = superview.directionalLayoutMargins.trailing
            
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailingMargin + padding).activate()
            
        case .toAnchor(let anchor, padding: let padding):
            trailingAnchor.constraint(equalTo: anchor, constant: padding).activate()
        }
    }
    
    func top(_ constraint: EdgeConstraintY) {
        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint top edge")
            return
        }
        
        switch constraint {
        case .toBounds(let padding):
            topAnchor.constraint(equalTo: superview.topAnchor, constant: padding).activate()
            
        case .toSafeArea(let padding):
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: padding).activate()
            
        case .toMargins(let padding):
            let topMargin = superview.directionalLayoutMargins.top
            
            topAnchor.constraint(equalTo: superview.topAnchor, constant: topMargin + padding).activate()
            
        case .toAnchor(let anchor, padding: let padding):
            topAnchor.constraint(equalTo: anchor, constant: padding).activate()
        }
    }
    
    func bottom(_ constraint: EdgeConstraintY) {
        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint bottom edge")
            return
        }
        
        switch constraint {
        case .toBounds(let padding):
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: padding).activate()
            
        case .toSafeArea(let padding):
            bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: padding).activate()
            
        case .toMargins(let padding):
            let bottomMargin = superview.directionalLayoutMargins.top
            
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottomMargin + padding).activate()
            
        case .toAnchor(let anchor, padding: let padding):
            bottomAnchor.constraint(equalTo: anchor, constant: padding).activate()
        }
    }
    
    // MARK: - Filling superview with an optional padding
    
    func fillX(padding: CGFloat = 0) {
        guard let superview = superview else {
            NSLog("No superview to fill horizontally")
            return
        }

        widthAnchor.constraint(equalTo: superview.widthAnchor, constant: padding).activate()
    }
    
    func fillY(padding: CGFloat = 0) {
        guard let superview = superview else {
            NSLog("No superview to fill vertically")
            return
        }

        heightAnchor.constraint(equalTo: superview.heightAnchor, constant: padding).activate()
    }
    
    func fillXY(padding: CGFloat = 0) {
        fillX(padding: padding)
        fillY(padding: padding)
    }
}
    
// MARK: - Partially filling superview

extension UIView {
    
    func fillX(part: CGFloat) {
        guard let superview = superview else {
            NSLog("No superview to partially fill horizontally")
            return
        }
        
        widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: part).activate()
    }
    
    func fillY(part: CGFloat) {
        guard let superview = superview else {
            NSLog("No superview to partially fill vertically")
            return
        }
        
        heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: part).activate()
    }
    
    func fillXY(part: CGFloat) {
        fillX(part: part)
        fillY(part: part)
    }
    
}

// MARK: - Setting compression resistance

extension UIView {
    
    func resistanceX(_ priority: UILayoutPriority) {
        setContentCompressionResistancePriority(priority, for: .horizontal)
    }
    
    func resistanceY(_ priority: UILayoutPriority) {
        setContentCompressionResistancePriority(priority, for: .vertical)
    }
    
    func resistanceXY(_ priority: UILayoutPriority) {
        resistanceX(priority)
        resistanceY(priority)
    }
    
}

// MARK: - Setting content hugging

extension UIView {
    
    func huggingX(_ priority: UILayoutPriority) {
        setContentHuggingPriority(priority, for: .horizontal)
    }
    
    func huggingY(_ priority: UILayoutPriority) {
        setContentHuggingPriority(priority, for: .vertical)
    }
    
    func huggingXY(_ priority: UILayoutPriority) {
        huggingX(priority)
        huggingY(priority)
    }
    
}

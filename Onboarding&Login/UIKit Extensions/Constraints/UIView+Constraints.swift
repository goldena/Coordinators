//
//  UIView+Extensions.swift
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

// Debugging flag to set background colors?
// XYKit

// MARK: - Size constraints - Constant

public extension UIView {
    
    @discardableResult
    func sizeX(_ width: CGFloat) -> NSLayoutConstraint {
        widthAnchor.constraint(equalToConstant: width).activate()
    }
    
    @discardableResult
    func sizeY(_ height: CGFloat) -> NSLayoutConstraint {
        heightAnchor.constraint(equalToConstant: height).activate()
    }
    
    #warning("Test this one")
    @discardableResult
    func sizeXY(width: CGFloat, height: CGFloat) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        ( width: sizeX(width), height: sizeY(height) )
    }
    
}

// MARK: - Size constraints relative to another view or optional part of it

public extension UIView {
    
    @discardableResult
    func sizeX(equalTo view: UIView, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        widthAnchor.constraint(equalTo: view.widthAnchor).activate()
    }
    
    @discardableResult
    func sizeY(equalTo view: UIView, multiplier: CGFloat = 1) -> NSLayoutConstraint {
        heightAnchor.constraint(equalTo: view.heightAnchor).activate()
    }
    
    @discardableResult
    func sizeXY(equalTo view: UIView, multiplier: CGFloat = 1) -> (width: NSLayoutConstraint, height: NSLayoutConstraint) {
        (width: sizeX(equalTo: view, multiplier: multiplier), height: sizeY(equalTo: view, multiplier: multiplier))
    }
    
}

// MARK: - Centring in a superview with an optional offset

public extension UIView {
    
    enum CenteringConstraintX {
        case superview
        case anchor(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    }
    
    enum CenteringConstraintY {
        case superview
        case anchor(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    }
    
    @discardableResult
    func centerX(with centerConstraint: CenteringConstraintX = .superview) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()
        
        guard let superview = superview else {
            NSLog("No superview to center \(self.description) horizontally in")
            
            return constraint
        }
        
        switch centerConstraint {
        case .superview:
            constraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            
        case .anchor(let anchor):
            constraint = centerXAnchor.constraint(equalTo: anchor)
        }
        
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func centerY(with centerConstraint: CenteringConstraintY = .superview) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()
        
        guard let superview = superview else {
            NSLog("No superview to center \(self.description) vertically in")
            
            return constraint
        }
        
        switch centerConstraint {
        case .superview:
            constraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            
        case .anchor(let anchor):
            constraint = centerYAnchor.constraint(equalTo: anchor)
        }
        
        constraint.activate()
        return constraint
    }
    
    #warning("Test this one")
    @discardableResult
    func centerXY() -> (x: NSLayoutConstraint, y: NSLayoutConstraint) {
        (x: centerX(), y: centerY())
    }

}

// MARK: - Aligning with another view with an optional offset

public extension UIView {
    
    @discardableResult
    func alignX(with view: UIView, offset: CGFloat = 0) -> NSLayoutConstraint {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset).activate()
    }
    
    @discardableResult
    func alignY(with view: UIView, offset: CGFloat = 0) -> NSLayoutConstraint {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset).activate()
    }

    #warning("Check this one")
    @discardableResult
    func alignXY(with view: UIView) -> (x: NSLayoutConstraint, y: NSLayoutConstraint) {
        (x: alignX(with: view), y: alignY(with: view))
    }
    
}
    
// MARK: - Partially filling superview

extension UIView {
    
    @discardableResult
    func fillX(multiplier: CGFloat = 1) -> NSLayoutConstraint? {
        guard let superview = superview else {
            NSLog("No superview to partially fill horizontally")
            
            return nil
        }
        
        return widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: multiplier).activate()
    }
    
    @discardableResult
    func fillY(multiplier: CGFloat = 1) -> NSLayoutConstraint? {
        guard let superview = superview else {
            NSLog("No superview to partially fill vertically")
            
            return nil
        }
        
        return heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: multiplier).activate()
    }
    
    @discardableResult
    func fillXY(multiplier: CGFloat = 1) -> (width: NSLayoutConstraint, height: NSLayoutConstraint)? {
        if let width = fillX(multiplier: multiplier),
           let height = fillY(multiplier: multiplier) {
            return (width, height)
        }
        
        return nil
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

        #warning("Test this one")
        heightAnchor.constraint(equalTo: superview.heightAnchor, constant: padding).activate()
    }
    
    func fillXY(padding: CGFloat = 0) {
        fillX(padding: padding)
        fillY(padding: padding)
    }
    
    #warning("FillX with safe areas and margins")
//    enum ConstraintXY {
//        case edges
//        case safeArea
//        case margins
//    }
//
//    enum EdgeConstraintY {
//
//        case bounds
//        case safeArea
//        case margins
//        case anchor(NSLayoutAnchor<NSLayoutYAxisAnchor>)
//
//    }
    
}



//
//  UIView+Extensions.swift
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
    
    enum CenteringConstraintX {
        
        case withSuperview
        case withAnchor(NSLayoutAnchor<NSLayoutXAxisAnchor>)
        
    }
    
    enum CenteringConstraintY {
        
        case withSuperview
        case withAnchor(NSLayoutAnchor<NSLayoutYAxisAnchor>)
        
    }
    
    #warning("start here")
    enum Axis {
        case X(CenteringConstraintX)
        case Y(CenteringConstraintY)
        case XY
    }
    
    // tableView.center.XY.withSuperview()
    
    @discardableResult
    func centerX(_ centerConstraint: CenteringConstraintX = .withSuperview) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()
        
        guard let superview = superview else {
            NSLog("No superview to center \(self.description) horizontally in")
            
            return constraint
        }
        
        switch centerConstraint {
        case .withSuperview:
            constraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            
        case .withAnchor(let anchor):
            constraint = centerXAnchor.constraint(equalTo: anchor)
        }
        
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func centerY(_ centerConstraint: CenteringConstraintY = .withSuperview) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()
        
        guard let superview = superview else {
            NSLog("No superview to center \(self.description) vertically in")
            
            return constraint
        }
        
        switch centerConstraint {
        case .withSuperview:
            constraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            
        case .withAnchor(let anchor):
            constraint = centerYAnchor.constraint(equalTo: anchor)
        }
        
        constraint.activate()
        return constraint
    }
    
    func centerXY() {
        centerX()
        centerY()
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



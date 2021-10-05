//
//  UIView+Extensions(EdgeConstraints).swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 5.10.21.
//

import UIKit

// MARK: - Constraint to edges

public extension UIView {
 
    enum EdgeConstraintX {
        
        case toBounds
        case toSafeArea
        case toMargins
        case toAnchor(NSLayoutAnchor<NSLayoutXAxisAnchor>)
        
    }

    enum EdgeConstraintY {
        
        case toBounds
        case toSafeArea
        case toMargins
        case toAnchor(NSLayoutAnchor<NSLayoutYAxisAnchor>)
        
    }
    
    @discardableResult
    func leading(_ edgeConstraintX: EdgeConstraintX) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()
        
        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint leading edge")
            
            return constraint
        }
                
        switch edgeConstraintX {
        case .toBounds:
            constraint = leadingAnchor.constraint(equalTo: superview.leadingAnchor)
            
        case .toSafeArea:
            constraint = leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor)
            
        case .toMargins:
            let leadingMargin = superview.directionalLayoutMargins.leading
            
            constraint = leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leadingMargin)
            
        case .toAnchor(let anchor):
            constraint = leadingAnchor.constraint(equalTo: anchor)
        }
        
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func trailing(_ edgeConstraintX: EdgeConstraintX) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()

        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint trailing edge")
            
            return constraint
        }
        
        switch edgeConstraintX {
        case .toBounds:
            constraint = trailingAnchor.constraint(equalTo: superview.trailingAnchor).activate()
            
        case .toSafeArea:
            constraint = trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor).activate()
            
        case .toMargins:
            let trailingMargin = superview.directionalLayoutMargins.trailing
            
            constraint = trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailingMargin).activate()
            
        case .toAnchor(let anchor):
            constraint = trailingAnchor.constraint(equalTo: anchor).activate()
        }
        
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func top(_ edgeConstraintY: EdgeConstraintY) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()

        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint top edge")
            
            return constraint
        }
        
        switch edgeConstraintY {
        case .toBounds:
            constraint = topAnchor.constraint(equalTo: superview.topAnchor).activate()
            
        case .toSafeArea:
            constraint = topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).activate()
            
        case .toMargins:
            let topMargin = superview.directionalLayoutMargins.top

            constraint = topAnchor.constraint(equalTo: superview.topAnchor, constant: topMargin).activate()
            
        case .toAnchor(let anchor):
            constraint = topAnchor.constraint(equalTo: anchor).activate()
        }
        
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func bottom(_ edgeConstraintY: EdgeConstraintY) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()

        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint bottom edge")
            
            return constraint
        }
        
        switch edgeConstraintY {
        case .toBounds:
            constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor).activate()
            
        case .toSafeArea:
            constraint = bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).activate()
            
        case .toMargins:
            let bottomMargin = superview.directionalLayoutMargins.top
            
            constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottomMargin).activate()
            
        case .toAnchor(let anchor):
            constraint = bottomAnchor.constraint(equalTo: anchor).activate()
        }
        
        constraint.activate()
        return constraint
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


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
        case bounds
        case safeArea
        case margins
        case anchor(NSLayoutAnchor<NSLayoutXAxisAnchor>)
    }

    enum EdgeConstraintY {
        case bounds
        case safeArea
        case margins
        case anchor(NSLayoutAnchor<NSLayoutYAxisAnchor>)
    }
    
    @discardableResult
    func leading(to edgeConstraintX: EdgeConstraintX) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()
        
        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint leading edge")
            
            return constraint
        }
                
        switch edgeConstraintX {
        case .bounds:
            constraint = leadingAnchor.constraint(equalTo: superview.leadingAnchor)
            
        case .safeArea:
            constraint = leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor)
            
        case .margins:
            let leadingMargin = superview.directionalLayoutMargins.leading
            
            constraint = leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leadingMargin)
            
        case .anchor(let anchor):
            constraint = leadingAnchor.constraint(equalTo: anchor)
        }
        
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func trailing(to edgeConstraintX: EdgeConstraintX) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()

        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint trailing edge")
            
            return constraint
        }
        
        switch edgeConstraintX {
        case .bounds:
            constraint = trailingAnchor.constraint(equalTo: superview.trailingAnchor).activate()
            
        case .safeArea:
            constraint = trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor).activate()
            
        case .margins:
            let trailingMargin = superview.directionalLayoutMargins.trailing
            
            constraint = trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailingMargin).activate()
            
        case .anchor(let anchor):
            constraint = trailingAnchor.constraint(equalTo: anchor).activate()
        }
        
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func top(to edgeConstraintY: EdgeConstraintY) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()

        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint top edge")
            
            return constraint
        }
        
        switch edgeConstraintY {
        case .bounds:
            constraint = topAnchor.constraint(equalTo: superview.topAnchor).activate()
            
        case .safeArea:
            constraint = topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).activate()
            
        case .margins:
            let topMargin = superview.directionalLayoutMargins.top

            constraint = topAnchor.constraint(equalTo: superview.topAnchor, constant: topMargin).activate()
            
        case .anchor(let anchor):
            constraint = topAnchor.constraint(equalTo: anchor).activate()
        }
        
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func bottom(to edgeConstraintY: EdgeConstraintY) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()

        guard let superview = superview else {
            NSLog("No superview found for \(self.description), cannot constraint bottom edge")
            
            return constraint
        }
        
        switch edgeConstraintY {
        case .bounds:
            constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor).activate()
            
        case .safeArea:
            constraint = bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).activate()
            
        case .margins:
            let bottomMargin = superview.directionalLayoutMargins.top
            
            constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottomMargin).activate()
            
        case .anchor(let anchor):
            constraint = bottomAnchor.constraint(equalTo: anchor).activate()
        }
        
        constraint.activate()
        return constraint
    }
    
}


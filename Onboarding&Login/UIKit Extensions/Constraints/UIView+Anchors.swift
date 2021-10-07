//
//  UIView+Anchors.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 7.10.21.
//

import UIKit

extension UIView {
    
    var leading: NSLayoutXAxisAnchor { leadingAnchor }
    var trailing: NSLayoutXAxisAnchor { trailingAnchor }

    var top: NSLayoutYAxisAnchor { topAnchor }
    var bottom: NSLayoutYAxisAnchor { bottomAnchor }
    
    var centerX: NSLayoutXAxisAnchor { centerXAnchor }
    var centerY: NSLayoutYAxisAnchor { centerYAnchor }

    var width: NSLayoutDimension { widthAnchor }
    var height: NSLayoutDimension { heightAnchor }
}

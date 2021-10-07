//
//  UIView+Compression&Hugging.swift
//  Onboarding&Login
//
//  Created by Denis Goloborodko on 7.10.21.
//

import UIKit

extension UIView {
    
    var compressionX: UILayoutPriority {
        get { contentCompressionResistancePriority(for: .horizontal) }
        set { setContentCompressionResistancePriority(newValue, for: .horizontal)}
    }
    var compressionY: UILayoutPriority {
        get { contentCompressionResistancePriority(for: .vertical) }
        set { setContentCompressionResistancePriority(newValue, for: .vertical) }
    }

    var huggingX: UILayoutPriority {
        get { contentHuggingPriority(for: .horizontal) }
        set { setContentCompressionResistancePriority(newValue, for: .horizontal) }
    }
    var huggingY: UILayoutPriority {
        get { contentHuggingPriority(for: .vertical) }
        set { setContentCompressionResistancePriority(newValue, for: .vertical) }
    }
    
}

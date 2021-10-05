import UIKit

public extension UILabel {
    
    convenience init(text: String? = nil, font: UIFont? = nil, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.text = text
        self.font = font
        
        addTo?.addSubview(self)
    }
    
}

public extension UITextField {
    
    convenience init(placeholder: String? = nil, font: UIFont? = nil, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder
        self.font = font
        
        addTo?.addSubview(self)
    }
    
}

public extension UIButton {
    
    convenience init(type: UIButton.ButtonType, title: String? = nil, font: UIFont? = nil, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        
        addTo?.addSubview(self)
    }
    
}

public extension UIView {
    
    convenience init(addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addTo?.addSubview(self)
    }
    
}

public extension UIPageControl {
    
    convenience init(numberOfPages: Int, currentPage: Int = 0, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfPages = numberOfPages
        self.currentPage = 0
        
        addTo?.addSubview(self)
    }
    
}

public extension UITableView {
    
    convenience init(CellClass: AnyClass? = nil, cellReuseIdentifier: String? = nil, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if CellClass != nil,
           let identifier = cellReuseIdentifier {
            self.register(CellClass, forCellReuseIdentifier: identifier)
        }
        
        addTo?.addSubview(self)
    }
    
}

public extension UIScrollView {
    
    convenience init(size: CGSize? = nil, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentSize = CGSize(width: size?.width ?? 0, height: size?.height ?? 0)
        
        addTo?.addSubview(self)
    }
    
}

public extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis? = nil, addTo: UIView? = nil) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis ?? .horizontal
        self.spacing = 100
        self.distribution = .equalCentering
        
        addTo?.addSubview(self)
    }
    
}

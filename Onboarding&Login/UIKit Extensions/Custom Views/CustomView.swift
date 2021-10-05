import UIKit

open class CustomView: UIView {
    
    // MARK: - View Lifecycle
    
    open func setupLayout() {}
    open func setupView() {}
    
    // MARK: - Init
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupLayout()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

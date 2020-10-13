//
//  FCJButton.swift
//  FCJ
//

import UIKit

class FCJButton: UIButton {
    
    private var actionBlock: (() -> Void)? = nil
    
    var normalColor: UIColor = UIColor.fcjClear {
        didSet {
            setTitleColor(normalColor, for: .normal)
        }
    }
    
    var highlightedColor: UIColor = UIColor.fcjClear {
        didSet {
            setTitleColor(highlightedColor, for: .highlighted)
        }
    }
    
    var disabledColor: UIColor = UIColor.fcjClear {
        didSet {
            setTitleColor(disabledColor, for: .disabled)
        }
    }
    
    var titleFont: UIFont? {
        didSet {
            titleLabel?.font = titleFont
        }
    }
    
    var title: String? {
        set {
            setTitle(newValue, for: .normal)
        }
        get {
            return currentTitle
        }
    }
    
    var image: UIImage? {
        didSet {
            setImage(image, for: .normal)
        }
    }
    
    var backgroundImage: UIImage? {
        didSet {
            setBackgroundImage(backgroundImage, for: .normal)
        }
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func addAction(_ action: @escaping () -> Void) {
        actionBlock = action
    }
    
    private func setup() {
        addTarget(self, action: #selector(didTouch), for: .touchUpInside)
    }
    
    @objc func didTouch() {
        actionBlock?()
    }
}


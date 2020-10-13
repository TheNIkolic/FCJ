//
//  FCJLabel.swift
//  FCJ
//

import UIKit

class FCJLabel: UILabel {
    
    var customInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: customInsets))
    }

    static func multiline() -> FCJLabel {
        let label: FCJLabel = FCJLabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {}
}


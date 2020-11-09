//
//  UIViewExtension.swift
//  FCJ
//

import UIKit

extension UIView {
    private static var tapKey = "tapKey"
    
    func applyShadowWith(color: UIColor = UIColor.clear, offset: CGSize = .zero, opacity: Float = 0 , radius: CGFloat = 0) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        clipsToBounds = false
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    @discardableResult
    func addTap(numberOfTapsRequired: Int = 1, numberOfTouchesRequired: Int = 1, action: @escaping () -> Void) -> UITapGestureRecognizer {
        isUserInteractionEnabled = true
        
        objc_setAssociatedObject(self, &UIView.tapKey, TapAction(action: action), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView))
        tapRecognizer.numberOfTapsRequired = numberOfTapsRequired
        tapRecognizer.numberOfTouchesRequired = numberOfTouchesRequired
        
        addGestureRecognizer(tapRecognizer)
        
        return tapRecognizer
    }
    
    @objc private func tapView() {
        if let tap = objc_getAssociatedObject(self, &UIView.tapKey) as? TapAction {
            tap.action()
        }
    }
}

private class TapAction {
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
}

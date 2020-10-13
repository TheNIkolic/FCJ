//
//  UIViewExtension.swift
//  FCJ
//

import UIKit

typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum GradientOrientation {
    case topRightBottomLeft
    case topLeftBottomRight
    case horizontal
    case vertical
    
    var startPoint : CGPoint {
        return points.startPoint
    }
    
    var endPoint : CGPoint {
        return points.endPoint
    }
    
    var points : GradientPoints {
        get {
            switch(self) {
            case .topRightBottomLeft:
                return (CGPoint(x: 0.0,y: 1.0), CGPoint(x: 1.0,y: 0.0))
            case .topLeftBottomRight:
                return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 1,y: 1))
            case .horizontal:
                return (CGPoint(x: 0.0,y: 0.5), CGPoint(x: 1.0,y: 0.5))
            case .vertical:
                return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 0.0,y: 1.0))
            }
        }
    }
}

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

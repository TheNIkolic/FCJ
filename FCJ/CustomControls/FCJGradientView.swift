//
//  FCJGradientView.swift
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

class FCJGradientView: UIView {

    var gradientSettings: (colors: [UIColor], orientation: GradientOrientation, type: CAGradientLayerType) = ([], .horizontal, .axial) {
        didSet {
            let gradientLayer = layer as! CAGradientLayer
            gradientLayer.colors = gradientSettings.colors.map { $0.cgColor }
            gradientLayer.startPoint = gradientSettings.orientation.startPoint
            gradientLayer.endPoint = gradientSettings.orientation.endPoint
            gradientLayer.type = gradientSettings.type
            gradientLayer.masksToBounds = true
        }
    }
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    public init() {
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


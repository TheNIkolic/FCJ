//
//  UIFontExtension.swift
//  FCJ
//

import UIKit

/// Velicine Fontova
struct FontSize {
    /// 10
    public static let tiny: CGFloat = 10
    /// 12
    public static let teeny: CGFloat = 12
    /// 14
    public static let small: CGFloat = 14
    /// 16
    public static let standard: CGFloat = 16
    /// 18
    public static let regular: CGFloat = 18
    /// 26
    public static let normal: CGFloat = 26
    /// 32
    public static let big: CGFloat = 32
    /// 40
    public static let large: CGFloat = 40
}

extension UIFont {
    
    class func fcjBoldFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Bold", size: fontSize)
    }
    
    class func fcjLightFont(ofSize fontSize: CGFloat) -> UIFont? {
        return UIFont(name: "Roboto-Light", size: fontSize)
    }
}


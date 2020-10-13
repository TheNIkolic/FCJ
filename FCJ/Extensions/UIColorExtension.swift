//
//  UIColorExtension.swift
//  FCJ
//

import UIKit

private let _fcjDefaultBlueColor: UIColor = UIColor(red: 14.0 / 255.0, green: 55.0 / 255.0, blue: 107.0 / 255.0, alpha: 1.0)
private let _fcjDefaultGreyColor: UIColor = UIColor(red: 151.0 / 255.0, green: 151.0 / 255.0, blue: 151.0 / 255.0, alpha: 1.0)

extension UIColor {
    public static var fcjBlack:                  UIColor { return .black }
    public static var fcjWhite:                  UIColor { return .white }
    public static var fcjClear:                  UIColor { return .clear }
    
    public static var fcjDefaultBlue:                   UIColor { return _fcjDefaultBlueColor }
    public static var fcjDefaultGrey:                   UIColor { return _fcjDefaultGreyColor }
}

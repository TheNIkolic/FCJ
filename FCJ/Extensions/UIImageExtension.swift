//
//  UIImageExtension.swift
//  FCJ
//

import UIKit

extension UIImage {

    var imageToBase64String: String {
        if let imageData: Data = self.pngData() {
            return imageData.base64EncodedString(options: .lineLength64Characters)
        }
        
        return ""
    }
}

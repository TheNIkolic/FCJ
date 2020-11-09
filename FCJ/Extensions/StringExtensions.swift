//
//  StringExtensions.swift
//  FCJ
//

import Foundation
import UIKit

extension String {
    
    var url: URL? {
        return URL(string: self)
    }
    
    var base64ToImage: UIImage? {
            if let data = Data(base64Encoded: self) {
                return UIImage(data: data)
            }
            return nil
        }
}

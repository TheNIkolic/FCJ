//
//  FCJImageView.swift
//  FCJ
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class FCJImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        if let url = NSURL(string: urlString) {
            imageUrlString = urlString
            image = nil
        
            if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
                self.image = imageFromCache
                return
            }
        
            URLSession.shared.dataTask(with: url as URL, completionHandler: { (data, respones, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                DispatchQueue.main.async(execute: { () -> Void in
                    if let imageToCache = UIImage(data: data!) {
                        if self.imageUrlString == urlString {
                            self.image = imageToCache
                        }
                        
                        imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                    }
                })
            }).resume()
        }
    }
}


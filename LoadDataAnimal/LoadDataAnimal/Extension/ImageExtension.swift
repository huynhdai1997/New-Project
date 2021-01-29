//
//  ImageExtension.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 1/4/21.
//
import Foundation
import UIKit

class CustomImageView: UIImageView {
    
    var imageCache = NSCache<AnyObject, UIImage>()
    var imageUrl: URL?
    func loadImage(url: URL, placeHolderImage: String) {
        
        imageUrl = url
        image = nil
        if image == nil {
            self.image = UIImage(named: placeHolderImage)
        }
        if let cacheImage = imageCache.object(forKey: url as AnyObject) {
            self.image = cacheImage
            return
        }
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {
                if let imageToCache = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        if self.imageUrl == url {
                            self.image = imageToCache
                        }
                        self.imageCache.setObject(imageToCache, forKey: url as AnyObject)
                    }
                }
            }
        }
    }
}





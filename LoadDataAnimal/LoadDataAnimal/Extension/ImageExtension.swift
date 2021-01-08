//
//  ImageExtension.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 1/4/21.
//
import Foundation
import UIKit

let imageCache = NSCache<AnyObject, UIImage>()
extension UIImageView {
    
    func loadImage(imgUrl: URL) {
        
       
        if let cacheImage = imageCache.object(forKey: imgUrl as AnyObject) {
            self.image = cacheImage
            return
        }
        self.image = nil
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: imgUrl) {
                if let imageToCache = UIImage(data: imageData){
                    DispatchQueue.main.async {
                        imageCache.setObject(imageToCache, forKey: imgUrl as AnyObject)
                        self?.image = imageToCache
                    }
                }
            }
        }
    }
}



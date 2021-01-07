//
//  ImageExtension.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 1/4/21.
//

import UIKit

let imageCache = NSCache<AnyObject, UIImage>()
extension UIImageView {
    
    func loadImage(imgUrl: URL) {
        if let cacheImage = imageCache.object(forKey: imgUrl as AnyObject) {
            self.image = cacheImage
            return
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imgUrl) {
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: imgUrl as AnyObject)
                        self.image = image
                    }
                }
            }
        }
    }
}



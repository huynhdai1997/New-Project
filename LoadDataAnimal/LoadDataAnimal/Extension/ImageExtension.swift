//
//  ImageExtension.swift
//  LoadDataAnimal
//
//  Created by Dai Huynh on 1/4/21.
//
import Foundation
import UIKit

var imageCache = NSCache<AnyObject, UIImage>()
class ImageView: UIImageView {

    var imageUrl: URL?
   
        func loadImage(imgUrl: URL, placeHolderImage: String) {
            
            imageUrl = imgUrl
            image = nil
            if image == nil {
                self.image = UIImage(named: placeHolderImage)
            }
            
            if let cacheImage = imageCache.object(forKey: imgUrl as AnyObject) {
                self.image = cacheImage
                return
            }
            
            DispatchQueue.global().async { [weak self] in
                if let imageData = try? Data(contentsOf: imgUrl) {
                    if let imageToCache = UIImage(data: imageData){
                        DispatchQueue.main.async {
                            
                            imageCache.setObject(imageToCache, forKey: imgUrl as AnyObject)
                            if self?.imageUrl == imgUrl {
                                self?.image = imageToCache
                            }
                        }
                    }
                }
            }
        }
    }





//
//  UIImageView+loadImage.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/23/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImage(from urlString: String, nsImageCache: NSCache<NSString, UIImage>) {
        let url = URL(string: urlString)!
        let artworkUrl = urlString as NSString
        if let cachedImage = nsImageCache.object(forKey: artworkUrl) {
            self.image = cachedImage
            print("loading image from cache")
        } else {
            let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                    nsImageCache.setObject(image, forKey: urlString as NSString)
                    print("saving image to cache")
                }
            }
            task.resume()
        }
    }
}


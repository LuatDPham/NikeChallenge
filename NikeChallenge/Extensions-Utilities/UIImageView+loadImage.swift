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
        guard let url = URL(string: urlString) else { return }
        let artworkUrl = urlString as NSString
        if let cachedImage = nsImageCache.object(forKey: artworkUrl) {
            self.image = cachedImage
        } else {
            let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
                if let myData = data, let image = UIImage(data: myData) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                    nsImageCache.setObject(image, forKey: urlString as NSString)
                }
            }
            task.resume()
        }
    }
}


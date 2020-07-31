//
//  DetailsViewController+configure.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/30/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import UIKit

extension DetailsViewController {
    
    func configure(album: Album, nsImageCache: NSCache<NSString, UIImage>) {
        self.album = album
        titleName.text = album.name
        artistName.text = album.artistName
        releastDate.text = album.releaseDate
        copyrightInfo.text = album.copyright
        artViewLarge.loadImage(from: album.artworkUrl100, nsImageCache: nsImageCache, completionHandler: { image in
            self.artViewLarge.image = image
        })
        
        var genreString = ""
        for genre in album.genres {
            genreString += genre.name + ", "
        }
        genreLabel.text = String(genreString.dropLast(2))
    }
    
}

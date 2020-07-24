//
//  AlbumCell.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/21/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    var albumImageView = UIImageView()
    var albumTitleLabel = UILabel()
    var albumArtisLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews(albumImageView, albumTitleLabel, albumArtisLabel)
        albumImageView.image = UIImage(named: "loading")
        configureViews()
        setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        
        func configureImageView() {
            albumImageView.layer.cornerRadius = MyDimensions.cornerRadius
            albumImageView.clipsToBounds = true
        }
        
        func configureTitleLabel() {
            albumTitleLabel.numberOfLines = 0
            albumTitleLabel.adjustsFontSizeToFitWidth = true
        }
        
        func configureArtisLabel() {
            albumArtisLabel.numberOfLines = 0
            albumArtisLabel.adjustsFontSizeToFitWidth = true
        }
        
        configureImageView()
        configureTitleLabel()
        configureArtisLabel()
        
    }
    
    private func setUpContraints() {
        
        func setImageConstraints() {
            albumImageView.leadingAnchor.constrain(to: leadingAnchor, with: MyDimensions.padding)
            albumImageView.heightAnchor.constrain(to: MyDimensions.imageHeight)
            albumImageView.widthAnchor.constrain(to: albumImageView.heightAnchor, multiplyBy: 1)
            albumImageView.centerYAnchor.constrain(to: centerYAnchor)
        }
        
        func setTitleLabelConstraints() {
            albumTitleLabel.leadingAnchor.constrain(to: albumImageView.trailingAnchor, with: MyDimensions.padding)
            albumTitleLabel.trailingAnchor.constrain(to: trailingAnchor, with: -MyDimensions.padding)
            albumTitleLabel.topAnchor.constrain(to: topAnchor, with: MyDimensions.outerPadding)
        }
        
        func setArtistLabelConstraints() {
            albumArtisLabel.leadingAnchor.constrain(to: albumTitleLabel.leadingAnchor)
            albumArtisLabel.trailingAnchor.constrain(to: albumTitleLabel.trailingAnchor)
            albumArtisLabel.topAnchor.constrain(to: albumTitleLabel.bottomAnchor, with: MyDimensions.padding)
        }
        
        setImageConstraints()
        setTitleLabelConstraints()
        setArtistLabelConstraints()
        
    }
    
    func configure(album: Album, nsImageCache: NSCache<NSString, UIImage>) {
        albumImageView.loadImage(from: album.artworkUrl100, nsImageCache: nsImageCache)
        albumTitleLabel.text = album.name
        albumArtisLabel.text = album.artistName
    }
    
}

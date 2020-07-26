//
//  DetailsViewController.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/24/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    var album: Album?
    
    var artViewLarge = UIImageView()
    var titleName = UILabel()
    var artistName = UILabel()
    var genreLabel = UILabel()
    var releastDate = UILabel()
    var copyrightInfo = UILabel()
    var iTunesButton = UIButton()
    var contentScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentScrollView)
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.pin(to: view)
        contentScrollView.contentSize = CGSize(width: MyDimensions.contentScollWidth, height: MyDimensions.contentScrollHeight)
        contentScrollView.addSubviews(artViewLarge, titleName, artistName, genreLabel, releastDate, copyrightInfo, iTunesButton)
        
        configureView()
        setupConstraints()
        
    }
    
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
    
    private func configureView() {
        
        func configureLabels(myLabels: UILabel...) {
            for label in myLabels {
                label.numberOfLines = 0
                label.lineBreakMode = .byWordWrapping
                label.adjustsFontSizeToFitWidth = true
            }
        }
        
        func configureImageView() {
            artViewLarge.layer.cornerRadius = MyDimensions.cornerRadius * 2
            artViewLarge.contentMode = .scaleAspectFill
            artViewLarge.clipsToBounds = true
        }
        
        func configureButton() {
            iTunesButton.setTitle("Go to iTunes", for: .normal)
            iTunesButton.setTitleColor(.black, for: .normal)
            iTunesButton.setTitleColor(.blue, for: .highlighted)
            iTunesButton.backgroundColor = .systemGray5
            iTunesButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        
        titleName.font = UIFont.preferredFont(forTextStyle: .headline)
        configureLabels(myLabels: titleName, artistName, genreLabel, releastDate, copyrightInfo)
        configureImageView()
        configureButton()
    }
    
    @objc func buttonTapped() {
        guard let albumAddress = album?.url.dropFirst(8) else { return }
        var customUrl = String(albumAddress.dropLast(5))
        customUrl = "itms://" + customUrl + "itunes"
        if let url = URL(string: customUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        
    }
    
    private func setupConstraints() {
        
        func setupArtViewContraints() {
            artViewLarge.topAnchor.constrain(to: contentScrollView.topAnchor)
            artViewLarge.leadingAnchor.constrain(.greaterThanOrEqual, to: view.leadingAnchor, with: MyDimensions.padding, prioritizeAs: .defaultLow)
            artViewLarge.trailingAnchor.constrain(.greaterThanOrEqual, to: view.trailingAnchor, with: -MyDimensions.padding, prioritizeAs: .defaultLow)
            artViewLarge.heightAnchor.constrain(to: MyDimensions.largeImageHeight)
            artViewLarge.widthAnchor.constrain(to: artViewLarge.heightAnchor, multiplyBy: 1)
            artViewLarge.centerXAnchor.constrain(to: view.centerXAnchor)
        }
        
        func setupTitleNameConstraints() {
            titleName.topAnchor.constrain(to: artViewLarge.bottomAnchor, with: MyDimensions.padding)
            titleName.leadingAnchor.constrain(to: view.safeAreaLayoutGuide.leadingAnchor, with: MyDimensions.outerPadding)
            titleName.trailingAnchor.constrain(to: view.safeAreaLayoutGuide.trailingAnchor, with: -MyDimensions.outerPadding)
        }
        
        func setupArtistNameConstraints() {
            artistName.leadingAnchor.constrain(to: titleName.leadingAnchor)
            artistName.topAnchor.constrain(to: titleName.bottomAnchor, with: MyDimensions.padding)
            artistName.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupGenreContraints() {
            genreLabel.leadingAnchor.constrain(to: titleName.leadingAnchor)
            genreLabel.topAnchor.constrain(to: artistName.bottomAnchor, with: MyDimensions.padding)
            genreLabel.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupReleastDateConstraints() {
            releastDate.leadingAnchor.constrain(to: titleName.leadingAnchor)
            releastDate.topAnchor.constrain(to: genreLabel.bottomAnchor, with: MyDimensions.padding)
            releastDate.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupCopyrightConstraints() {
            copyrightInfo.leadingAnchor.constrain(to: titleName.leadingAnchor)
            copyrightInfo.topAnchor.constrain(to: releastDate.bottomAnchor, with: MyDimensions.padding)
            copyrightInfo.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupItunesConstraints() {
            iTunesButton.topAnchor.constrain(.greaterThanOrEqual, to: copyrightInfo.bottomAnchor, with: MyDimensions.padding*3, prioritizeAs: UILayoutPriority(rawValue: 998))
            iTunesButton.leadingAnchor.constrain(to: view.safeAreaLayoutGuide.leadingAnchor, with: MyDimensions.outerPadding)
            iTunesButton.trailingAnchor.constrain(to: view.safeAreaLayoutGuide.trailingAnchor, with: -MyDimensions.outerPadding)
            iTunesButton.bottomAnchor.constrain(to: view.safeAreaLayoutGuide.bottomAnchor, with: -MyDimensions.outerPadding, prioritizeAs: UILayoutPriority(rawValue: 999))
        }
        
        setupArtViewContraints()
        setupTitleNameConstraints()
        setupArtistNameConstraints()
        setupGenreContraints()
        setupReleastDateConstraints()
        setupCopyrightConstraints()
        setupItunesConstraints()
        
    }
    
}

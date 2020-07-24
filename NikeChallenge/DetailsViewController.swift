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
    var genre = UILabel()
    var releastDate = UILabel()
    var copyrightInfo = UILabel()
    var iTunesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubviews(artViewLarge, titleName, artistName, genre, releastDate, copyrightInfo, iTunesButton)
        
        configureView()
        setupConstraints()
        
    }
    
    func configure(album: Album, nsImageCache: NSCache<NSString, UIImage>) {
        self.album = album
        titleName.text = album.name
        artistName.text = album.artistName
        genre.text = album.genres[0].name
        releastDate.text = album.releaseDate
        copyrightInfo.text = album.copyright
        artViewLarge.loadImage(from: album.artworkUrl100, nsImageCache: nsImageCache)
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
            artViewLarge.clipsToBounds = true
        }
        
        func configureButton() {
            iTunesButton.setTitle("Go to album", for: .normal)
            iTunesButton.setTitleColor(.black, for: .normal)
            iTunesButton.setTitleColor(.blue, for: .highlighted)
            iTunesButton.backgroundColor = .lightGray
            iTunesButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        
        configureLabels(myLabels: titleName, artistName, genre, releastDate, copyrightInfo)
        configureImageView()
        configureButton()
    }
    
    @objc func buttonTapped() {
        print((album?.url)!)
        // Added Url scheme NikeChallengeOpen
        // Added to plist
        //             <key>LSApplicationQueriesSchema</key>
        //        <array>
        //            <string>NikeChallengeOpen</string>
        //        </array>
        guard let albumAddress = album?.url.dropFirst(8) else { return }
        var customUrl = String(albumAddress.dropLast(5))
        customUrl = "itms://" + customUrl + "itunes"
        if let url = URL(string: customUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
                print("\(customUrl) opened")
            } else {
                print("App schema not found")
            }
        } else {
            print("custom url not found")
        }
        print("end of button tapped")
        

//        let customUrlTest = "test://"
//        if let url = URL(string: customUrlTest) {
//            if UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.open(url)
//                print("\(url.absoluteString) opened")
//            } else {
//                print("Test App schema not found")
//            }
//        } else {
//            print("Test custom url not found")
//        }
//        print("end of test button tapped")
        
    }
    
    private func setupConstraints() {
        
        func setupArtViewContraints() {
            artViewLarge.topAnchor.constrain(to: view.safeAreaLayoutGuide.topAnchor, with: MyDimensions.padding)
            artViewLarge.leadingAnchor.constrain(.greaterThanOrEqual, to: view.leadingAnchor, with: MyDimensions.padding, prioritizeAs: .defaultLow)
            artViewLarge.trailingAnchor.constrain(.greaterThanOrEqual, to: view.trailingAnchor, with: -MyDimensions.padding, prioritizeAs: .defaultLow)
            artViewLarge.heightAnchor.constrain(to: view.heightAnchor, multiplyBy: 3/8)
            artViewLarge.widthAnchor.constrain(to: artViewLarge.heightAnchor, multiplyBy: 1)
            artViewLarge.centerXAnchor.constrain(to: view.centerXAnchor)
        }
        
        func setupTitleNameConstraints() {
            titleName.topAnchor.constrain(to: artViewLarge.bottomAnchor, with: MyDimensions.padding)
            titleName.leadingAnchor.constrain(to: view.leadingAnchor, with: MyDimensions.outerPadding)
            titleName.trailingAnchor.constrain(to: view.trailingAnchor, with: -MyDimensions.outerPadding)
        }
        
        func setupArtistNameConstraints() {
            artistName.leadingAnchor.constrain(to: titleName.leadingAnchor)
            artistName.topAnchor.constrain(to: titleName.bottomAnchor, with: MyDimensions.padding)
            artistName.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupGenreContraints() {
            genre.leadingAnchor.constrain(to: titleName.leadingAnchor)
            genre.topAnchor.constrain(to: artistName.bottomAnchor, with: MyDimensions.padding)
            genre.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupReleastDateConstraints() {
            releastDate.leadingAnchor.constrain(to: titleName.leadingAnchor)
            releastDate.topAnchor.constrain(to: genre.bottomAnchor, with: MyDimensions.padding)
            releastDate.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupCopyrightConstraints() {
            copyrightInfo.leadingAnchor.constrain(to: titleName.leadingAnchor)
            copyrightInfo.topAnchor.constrain(to: releastDate.bottomAnchor, with: MyDimensions.padding)
            copyrightInfo.trailingAnchor.constrain(to: titleName.trailingAnchor)
        }
        
        func setupItunesConstraints() {
            iTunesButton.centerXAnchor.constrain(to: view.centerXAnchor)
            iTunesButton.leadingAnchor.constrain(to: view.leadingAnchor, with: MyDimensions.outerPadding)
            iTunesButton.trailingAnchor.constrain(to: view.trailingAnchor, with: -MyDimensions.outerPadding)
            iTunesButton.bottomAnchor.constrain(to: view.bottomAnchor, with: -MyDimensions.outerPadding)
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

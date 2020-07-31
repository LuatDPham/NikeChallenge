//
//  DetailsViewController+constraints.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/30/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import UIKit

extension DetailsViewController {
    
    func setupConstraints() {
        
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

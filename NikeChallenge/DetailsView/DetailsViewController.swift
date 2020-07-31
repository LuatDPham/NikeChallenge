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
    
    var artViewLarge = UIImageView(),
        titleName = UILabel(),
        artistName = UILabel(),
        genreLabel = UILabel(),
        releastDate = UILabel(),
        copyrightInfo = UILabel(),
        iTunesButton = UIButton(),
        contentScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupContentScrollView()
        configureSubviews()
        setupConstraints()
        
    }
    
    private func setupContentScrollView() {
        view.addSubviews(contentScrollView)
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.pin(to: view)
        contentScrollView.contentSize = CGSize(width: MyDimensions.contentScollWidth, height: MyDimensions.contentScrollHeight)
        contentScrollView.addSubviews(artViewLarge, titleName, artistName, genreLabel, releastDate, copyrightInfo, iTunesButton)
    }
    
    private func configureSubviews() {
        
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
        
        func configureItunesButton() {
            iTunesButton.setTitle("Go to iTunes", for: .normal)
            iTunesButton.setTitleColor(.black, for: .normal)
            iTunesButton.setTitleColor(.blue, for: .highlighted)
            iTunesButton.backgroundColor = .systemGray5
            iTunesButton.addTarget(self, action: #selector(deepLinkToItunes), for: .touchUpInside)
        }
        
        titleName.font = UIFont.preferredFont(forTextStyle: .headline)
        configureLabels(myLabels: titleName, artistName, genreLabel, releastDate, copyrightInfo)
        configureImageView()
        configureItunesButton()
    }
    
    
    @objc func deepLinkToItunes() {
        coordinator?.deepLinkToItunes(urlAddress: album?.url)
    }
}

//
//  MainCoordinator.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/24/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.


import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        let vc = AlbumsViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showAlbumDetails(album: Album, nsImageCache: NSCache<NSString, UIImage>) {
        let vc = DetailsViewController()
        vc.configure(album: album, nsImageCache: nsImageCache)
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    @objc func deepLinkToItunes(urlAddress: String?) {
        let numCharactersOfHttp = 8
        let numCharactersOfResource = 5
        guard let albumAddress = urlAddress?.dropFirst(numCharactersOfHttp) else { return }
        let trimmedAddress = String(albumAddress.dropLast(numCharactersOfResource))
        let itunesLink = "itms://" + trimmedAddress + "itunes"
        if let urlScheme = URL(string: itunesLink) {
            if UIApplication.shared.canOpenURL(urlScheme) {
                UIApplication.shared.open(urlScheme)
            }
        }
    }
}

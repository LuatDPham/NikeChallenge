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
        let vc = AlbumListViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func displayDetails(album: Album, nsImageCache: NSCache<NSString, UIImage>) {
        let vc = DetailsViewController()
        vc.configure(album: album, nsImageCache: nsImageCache)
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    
}

//
//  Coordinator.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/23/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

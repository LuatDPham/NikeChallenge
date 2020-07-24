//
//  UIView+extensions.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/21/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView ...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}

extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constrain(to: superView.topAnchor)
        leadingAnchor.constrain(to: superView.leadingAnchor)
        trailingAnchor.constrain(to: superView.trailingAnchor)
        bottomAnchor.constrain(to: superView.bottomAnchor)
    }
    
}

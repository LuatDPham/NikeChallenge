//
//  AlbumViewController+TableViewController.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/21/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import UIKit

extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.albumCell) as? AlbumCell else {
            return UITableViewCell()
        }
        let album = albums[indexPath.row]
        cell.configure(album: album, nsImageCache: nsImageCache)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showAlbumDetails(album: albums[indexPath.row], nsImageCache: nsImageCache)
    }
    
    
}


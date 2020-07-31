//
//  AlbumsViewController.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/21/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    var albumTableView = UITableView()
    var albums = [Album]() {
        didSet {
            DispatchQueue.main.async {
                self.albumTableView.reloadData()
            }
        }
    }
    var nsImageCache = NSCache<NSString, UIImage>()
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Apple Music Albums"
        
        configureTableView()
        makeAlbumRequest()
    }
    
    func setTableViewDelegates() {
        albumTableView.delegate = self
        albumTableView.dataSource = self
    }
    
    func configureTableView() {
        setTableViewDelegates()
        albumTableView.rowHeight = MyDimensions.cellHeight
        albumTableView.register(AlbumCell.self, forCellReuseIdentifier: Cells.albumCell)
        view.addSubview(albumTableView)
        albumTableView.pin(to: view)
    }
    
    func makeAlbumRequest() {
        let albumRequest = AlbumRequest()
        albumRequest.getAlbums { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let albums):
                self?.albums.append(contentsOf: albums)
            }
        }
    }
    
}


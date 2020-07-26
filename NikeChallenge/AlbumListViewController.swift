//
//  AlbumListViewController.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/21/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import UIKit

class AlbumListViewController: UIViewController {
    
    var tableView = UITableView()
    var albums = [Album]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var nsImageCache = NSCache<NSString, UIImage>()
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Apple Music Albums"
        configureTableView()
        fetchData()
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureTableView() {
        setTableViewDelegates()
        tableView.rowHeight = 140
        tableView.register(AlbumCell.self, forCellReuseIdentifier: Cells.albumCell)
        view.addSubview(tableView)
        tableView.pin(to: view)
    }
    
    func fetchData() {
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


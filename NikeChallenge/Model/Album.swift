//
//  Album.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/21/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import Foundation


struct Feed: Decodable {
    let feed: AlbumFeed
}

struct AlbumFeed: Decodable {
    let title: String
    let id: String
    let author: [String: String]
    let results: [Album]
}

struct Album: Decodable {
    let artistName: String
    let name: String
    let genres: [Genre]
    let artworkUrl100: String
    let releaseDate: String
    let copyright: String
    let url: String
}

struct Genre: Decodable {
    let genreId: String
    let name: String
    let url: String
}

//
//  AlbumRequest.swift
//  NikeChallenge
//
//  Created by Rave BizzDev on 7/21/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import Foundation

struct AlbumRequest {
    
    let resourceURL: URL
    
    init(countryCode: String = "us", numAlbums: Int = 100) {
        let resourceString = "https://rss.itunes.apple.com/api/v1/\(countryCode)/apple-music/top-albums/all/\(numAlbums)/explicit.json"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
    }
    
    func getAlbums(completion: @escaping (Result<[Album], AlbumRequestError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            guard let albumJsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let albumResponses = try decoder.decode(Feed.self, from: albumJsonData)
                let albumDetails = albumResponses.feed.results
                completion(.success(albumDetails))
            } catch {
                completion(.failure(.cannotDecodeData))
            }
        }
        dataTask.resume()
    }
}

enum AlbumRequestError: Error {
    case noDataAvailable
    case cannotDecodeData
}

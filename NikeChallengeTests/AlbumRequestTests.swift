//
//  NikeChallengeTests.swift
//  NikeChallengeTests
//
//  Created by Rave BizzDev on 7/21/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import XCTest
@testable import NikeChallenge

class AlbumRequestTests: XCTestCase {
    
    var sut: AlbumRequest?
    
    override func setUp() {
        super.setUp()
        sut = AlbumRequest()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_DataTaskCompletesWithStatusCode200() {
        guard let url =
            URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/10/explicit.json") else {
            return
        }
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func test_GetAlbumDownloadsArrayOfAlbums() {
        let promise = expectation(description: "Albums contain 100 items")
        var albums: [Album] = []
        var responseError: Error?
        sut?.getAlbums { result in
            switch result {
            case .failure(let error):
                responseError = error
            case .success(let downloadedAlbums):
                albums = downloadedAlbums
                promise.fulfill()
                
            }
        }
        wait(for: [promise], timeout: 5)
        XCTAssertNil(responseError)
        XCTAssertEqual(albums.count, 100)
    }
    
    func test_GetAlbumHasArtistName() {
        let promise = expectation(description: "Artist name is not nil")
        var albums: [Album] = []
        var responseError: Error?
        sut?.getAlbums { result in
            switch result {
            case .failure(let error):
                responseError = error
            case .success(let downloadedAlbums):
                albums = downloadedAlbums
                promise.fulfill()
                
            }
        }
        wait(for: [promise], timeout: 5)
        XCTAssertNil(responseError)
        XCTAssertNotNil(albums.first?.artistName)
    }
    
    
    
}

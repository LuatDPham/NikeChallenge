//
//  AlbumTest.swift
//  NikeChallengeTests
//
//  Created by Rave BizzDev on 7/26/20.
//  Copyright © 2020 Rave BizzDev. All rights reserved.
//

import XCTest
@testable import NikeChallenge

class AlbumTest: XCTestCase {
    
    var sut: Feed?
    
    override func setUpWithError() throws {
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: "mockData", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) {
                let decoder = JSONDecoder()
                let albumResponses = try? decoder.decode(Feed.self, from: jsonData)
                sut = albumResponses
            }
        }
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func test_DecodeAlbumModelFromMockData() {
        guard let sut = sut else { return }
        let albumDetails = sut.feed.results
        XCTAssertEqual(albumDetails.count, 1, "Album should have 1 entry")
        
    }

    func test_FeedModelCanStoreArrayOfAlbums() {
        let oneAblum = Album(artistName: "", name: "Fake Album", genres: [], artworkUrl100: "", releaseDate: "", copyright: "", url: "")
        let albums = Array(repeating: oneAblum, count: 3)
        let author = ["name": "Fake name"]
        let feed = Feed(feed: AlbumFeed(title: "", id: "1", author: author, results: albums))
        
        XCTAssertTrue(feed.feed.results.first?.name == "Fake Album", "Array of albums can be stored in Feed model")
    }
    
    func test_AlbumModelShouldHaveArrayOfGenres() {
        guard let sut = sut else { return }
        let albumDetails = sut.feed.results
        let genres = albumDetails.first?.genres
        
        XCTAssertNotNil(genres?.first)
    }
    
}



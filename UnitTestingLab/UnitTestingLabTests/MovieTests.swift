//
//  MovieTests.swift
//  UnitTestingLabTests
//
//  Created by Yuliia Engman on 12/4/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import XCTest
@testable import UnitTestingLab

class MovieTests: XCTestCase {

   let fileNameWars = "starWars"
   let ext = "json"
    
    func testGettingEpisodes() {
        // arrange
        let expectedEpisodesCount = 7
        let data = Bundle.readRawJSONData(filename: fileNameWars, ext: ext)
        
        // act
        let episodes = MovieData.getEpisodes(from: data)
        
        // assert
        XCTAssertEqual(episodes.count, expectedEpisodesCount)
    }

}

//extension MovieTests {
//
//    func getRawDataFromMovie() -> Data {
//        let data = Bundle.readRawJSONData(filename: fileNameWars, ext: ext)
//        return data
//    }
//    func getMovies() -> [Episode] {
//        let data = getRawDataFromMovie
//        let allMovies = Episode.g
//        return allMovies
//    }
//}

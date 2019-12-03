//
//  StarWarsTests.swift
//  IntroductionToUnitTestingTests
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import XCTest
@testable import IntroductionToUnitTesting

class StarWarsTests: XCTestCase{
    func testGetValidURL(){
        // Arrange
        let filename = "StarWarsData"
        let ext = "json"
        
        // Act
        let fileURL = Bundle.main.url(forResource: filename, withExtension: ext)
        
        // Assert
        XCTAssertNotNil(fileURL, "Could not retrieve a valid url")
    }
    
    func testGetData() {
        // Arrange
        let filename = "StarWarsData"
        let ext = "json"
        
        // Act
        let data = StarWarsFact.getData(from: filename, with: ext)
        
        // Assert
        XCTAssertNotNil(data, "Could not retrieve data")
    }
    
    func testGetStarWarsFacts() {
        // Arrange
        let filename = "StarWarsData"
        let ext = "json"
        let data = StarWarsFact.getData(from: filename, with: ext)
        
        // Act
        let starWarsFacts = StarWarsFact.getStarWarsFacts(using: data)
        
        // Assert
        XCTAssertGreaterThan(starWarsFacts.count, 0, "\(starWarsFacts.count) is not greater than \(0)")
    }
    
    func testAreTheFactsValid() {
        // Arrange
        let filename = "StarWarsData"
        let ext = "json"
        let data = StarWarsFact.getData(from: filename, with: ext)
        let starWarsMovies = StarWarsFact.getStarWarsFacts(using: data)
        let expectedId = 4
        
        // Act
        let firstMovieListed = starWarsMovies.first!
        
        // Assert
        XCTAssertEqual(firstMovieListed.episodeId, expectedId, "\(firstMovieListed.episodeId) is not equal to \(expectedId)")
    }
}

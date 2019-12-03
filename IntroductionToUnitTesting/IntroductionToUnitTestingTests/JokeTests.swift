//
//  IntroductionToUnitTestingTests.swift
//  IntroductionToUnitTestingTests
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import XCTest
@testable import IntroductionToUnitTesting

class JokeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetValidURL() {
        // Arrange
        
        let filename = "JokeData"
        let ext = "json"
        
        // Act
        let fileURL = Bundle.main.url(forResource: filename, withExtension: ext)
        
        // Assert
        XCTAssertNotNil(fileURL, "Encountered a value of nil when accessing the file")
    }
    
    func testGetValidData() {
        // Arrange
        let filename = "JokeData"
        let ext = "json"
                
        // Act
        let data = Joke.getData(from: filename, with: ext)
        
        // Assert
        XCTAssertNotNil(data, "Encountered a value of nil when attempting to access data.")
    }
    
    func testGetJokes(){
        // Arrange
        let filename = "JokeData"
        let ext = "json"
        let data = Joke.getData(from: filename, with: ext)
        
        // Act
        let jokes = Joke.getJokes(using: data)

        // Assert
        XCTAssertGreaterThan(jokes.count, 0, "\(jokes.count) is not greater than \(0)")
    }
    
    func testJokesAreValidData() {
        // Arrange
        let filename = "JokeData"
        let ext = "json"
        let data = Joke.getData(from: filename, with: ext)
        let jokes = Joke.getJokes(using: data)
        let expectedId = 28
        
        // Act
        let firstJoke = jokes.first!
        
        // Assert
        XCTAssertEqual(firstJoke.id, expectedId, "\(firstJoke.id) is not equal to \(expectedId)")
    }
    
}

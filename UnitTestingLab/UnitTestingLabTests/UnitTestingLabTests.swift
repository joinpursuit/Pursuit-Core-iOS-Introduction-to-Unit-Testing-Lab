//
//  UnitTestingLabTests.swift
//  UnitTestingLabTests
//
//  Created by Yuliia Engman on 12/3/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import XCTest
@testable import UnitTestingLab

let filename = "jokesAPI"
let ext = "json"

class UnitTestingLabTests: XCTestCase {
    
    func testGettingJokes() {
        // arrange
        let expectedJokesCount = 10
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        
        // act
        let jokes = Joke.getJoke(from: data)
        
        // assert
        XCTAssertEqual(jokes.count, expectedJokesCount)
    }
    
    func testIFirstJokeSetup() {
        // arrange
        let firstJoke = getJokes().first
        let expectedJoke = "What's the object-oriented way to become wealthy?"

        //act
        let setup = firstJoke?.setup ?? "no jokes"

        //assert
        XCTAssertEqual(expectedJoke, setup, "first joke should be \(expectedJoke)")

    }
}


extension UnitTestingLabTests {

    func getRawData() -> Data {
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        return data
    }
    func getJokes() -> [Joke] {
        let data = getRawData()
        let jokesAll = Joke.getJoke(from: data)
        return jokesAll
    }
}






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
        //        let filename = "jokesAPI"
        //        let ext = "json"
        //        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        //        let jokes = Joke.getJokes(from: data)
        //        let expectedFirstJoke = "What's the object-oriented way to become wealthy?"
        //
        //        // act
        //        let joke = firstJoke?.setup ?? "correct"
        //
        //        // assert
        //        XCTAssertEqual(expectedJoke, joke, "expected joke should be \(expectedJoke)")
        
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


//
//    func testFirstUserNameIsChristine() {
//        // arrange
//        let filename = "randomUsers"
//        let ext = "json"
//        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
//        let users = RandomUserData.getUsers(from: data)
//        let expectedFirstName = "Christine"
//
//        // act
//        let firstUser = users.first!
//
//        // assert
//        XCTAssertEqual(firstUser.name.firstName, expectedFirstName, "\(firstUser.name.firstName) should be equal to \(expectedFirstName)")
//    }
//
//    func testFirstUserCountry() {
//        // arrange
//        let firstUser = getUsers().first
//     let expectedCountry = "United States"
//
//        // act
//        let country = firstUser?.location.country ?? "Ukraine"
//
//        // assert
//        XCTAssertEqual(expectedCountry, country, "expected country sould be \(expectedCountry)")
//    }
//
//    func testFirstUserPostcode() {
//        // arrange
//        let firstUser = getUsers().first
//        let expectedPostcode = "29056"
//
//        //act
//        let postcode = firstUser?.location.postcode.info()
//
//        // assert
//        XCTAssertEqual(expectedPostcode, postcode, "postcode should be equal to \(expectedPostcode)")
//    }
//
//}
//
//extension RandomUserAppTests {
//
//    func getRawData() -> Data {
//        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
//        return data
//    }
//    func getUsers() -> [User] {
//        let data = getRawData()
//        let users = RandomUserData.getUsers(from: data)
//        return users
//    }
//}



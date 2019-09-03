//
//  Unit_Test_LabTests.swift
//  Unit Test LabTests
//
//  Created by Michelle Cueva on 8/29/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import XCTest
@testable import Unit_Test_Lab

class Unit_Test_LabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTrivia() {
        let data = getTriviaDataFromJSON()
        do {
            let trivia = try
                TriviaWrapper.getTrivia(from: data)
            XCTAssert(type(of: trivia) == TriviaWrapper.self, "Not of type TriviaWrapper")
        } catch {
            XCTFail("Unable to get data")
        }
    }
    
    
    private func getTriviaDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "Trivia API", ofType: "json") else {fatalError("did not find path")}
        
        let url = URL(fileURLWithPath: pathToData)
        
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("\(jsonError)")
        }
        
    }
    
    func testTriviaResultsCount() {
        let data = getTriviaDataFromJSON()
        
        do {
            let trivia = try
                TriviaWrapper.getTrivia(from: data)
             XCTAssert(trivia.count == 10, "Count is not ten")
        } catch {
            XCTFail("Unable to get data")
        }
    }
    
    func testCleanQuestionString() {
        let data = getTriviaDataFromJSON()
        do {
            let trivia = try
                TriviaWrapper.getTrivia(from: data)
            XCTAssert(!trivia[0].getCleanQuestionString().contains("%"), "It's an empty string")
        } catch {
            XCTFail("Unable to get data")
        }
    }
    
    func testCleanCorrectString() {
        let data = getTriviaDataFromJSON()
        do {
            let trivia = try
                TriviaWrapper.getTrivia(from: data)
             XCTAssert(!trivia[0].getCleanCorrectString().contains("%"), "It's an empty string")
        } catch {
            XCTFail("Unable to get data")
        }
    }
    
    func testCleanIncorrectArr() {
        let data = getTriviaDataFromJSON()
        do {
            let trivia = try
                TriviaWrapper.getTrivia(from: data)
             XCTAssert(!trivia[0].getCleanIncorrectArr().contains("%"), "It's an empty Arr")
        } catch {
            XCTFail("Unable to get data")
        }
    }
    
    func testJokes() {
        let data = getJokesDataFromJSON()
        do {
          let jokes = try
            Jokes.getJokes(from: data)
            XCTAssert(type(of: jokes) == [Jokes].self, "This is not an array of Jokes")
        } catch {
            XCTFail("Unable to get data")
        }
    }
    
    private func getJokesDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "jokesAPI", ofType: "json") else {fatalError("did not find path")}
        
        let url = URL(fileURLWithPath: pathToData)
        
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("\(jsonError)")
        }
        
    }
    
    func testJokesCount() {
        let data = getJokesDataFromJSON()
        do {
            let jokes = try
                Jokes.getJokes(from: data)
            XCTAssert(jokes.count == 10, "Count is not ten")
        } catch {
            XCTFail("Unable to get data")
        }
    }

    func testStarWars() {
        let data = getStarWarsDataFromJSON()
        do {
            let starWars = try
                StarWarsWrapper.getStarWars(from: data)
            XCTAssert(type(of: starWars) == StarWarsWrapper.self, "This is not of type StarWarsWrapper")
        } catch {
           XCTFail("Unable to get data")
        }
        
    }
    
    
    private func getStarWarsDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "Star Wars API", ofType: "json") else {fatalError("did not find path")}
        
        let url = URL(fileURLWithPath: pathToData)
        
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("\(jsonError)")
        }
        
    }
    
    func testSWResultsCount() {
        let data = getStarWarsDataFromJSON()
        do {
            let starWars = try
                StarWarsWrapper.getStarWars(from: data)
            XCTAssert(starWars.count == 7, "Count is not seven")
        } catch {
            XCTFail("Unable to get data")
        }
    }

}

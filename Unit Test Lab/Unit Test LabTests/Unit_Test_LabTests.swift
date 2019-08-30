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
        guard let trivia = TriviaWrapper.getTrivia(from: data) else {return}
        XCTAssert(trivia != nil, "Does not exist")
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
        guard let trivia = TriviaWrapper.getTrivia(from: data) else{return}
        XCTAssert(trivia.results.count == 10, "Count is not ten")
    }
    
    func testCleanCorrectString() {
        let data = getTriviaDataFromJSON()
        guard let trivia = TriviaWrapper.getTrivia(from: data) else{return}
        XCTAssert(!trivia.results[0].getCleanCorrectString().contains("%"), "It's an empty string")
    }
    
    func testCleanIncorrectArr() {
        let data = getTriviaDataFromJSON()
        guard let trivia = TriviaWrapper.getTrivia(from: data) else{return}
        XCTAssert(!trivia.results[0].getCleanIncorrectArr().contains("%"), "It's an empty Arr")
        
    }
    
    func testJokes() {
        let data = getJokesDataFromJSON()
        guard let jokes = Jokes.getJokes(from: data) else {return}
        XCTAssert(jokes != nil, "Does not exist")
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
        guard let jokes = Jokes.getJokes(from: data) else{return}
        XCTAssert(jokes.count == 10, "Count is not ten")
    }

    func testStarWars() {
        let data = getStarWarsDataFromJSON()
        guard let starWars = StarWarsWrapper.getStarWars(from: data) else {return}
        XCTAssert(starWars != nil, "Does not exist")
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
        guard let starWars = StarWarsWrapper.getStarWars(from: data) else {return}
        XCTAssert(starWars.results.count == 7, "Count is not seven")
    }
    
    

}

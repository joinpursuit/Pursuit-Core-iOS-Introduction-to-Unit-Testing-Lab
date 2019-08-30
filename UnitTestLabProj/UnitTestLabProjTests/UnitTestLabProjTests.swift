//
//  UnitTestLabProjTests.swift
//  UnitTestLabProjTests
//
//  Created by Kevin Natera on 8/29/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import XCTest
@testable import UnitTestLabProj

class UnitTestLabProjTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testIfJokeJSONExists() {
        let data = getJokeDataFromJSON()
        XCTAssertTrue(data != nil)
    }
    
    func testIfJokeDataLoaded(){
        let data = getJokeDataFromJSON()
        do {
            let joke = try Jokes.getJokeData(from: data)
            XCTAssertTrue(joke.count == 10)
        } catch {
            print(error)
        }

    }
//---------------------------------------------------------------
    func testIfStarWarsJSONExists() {
        let data = getMovieDataFromJSON()
        XCTAssertTrue(data != nil)
    }
    
    func testIfStarWarsDataLoaded() {
        let data = getMovieDataFromJSON()
        do {
            let movie = try StarWarsWrapper.getMovieData(from: data)
            XCTAssertTrue(movie.count == 7)
        } catch {
            print(error)
        }
    }
    
//---------------------------------------------------------------
    func testIfTriviaJSONExists() {
        let data = getTriviaDataFromJSON()
        
        XCTAssertTrue(data != nil)
    }
    
    func testIfTriviaDataLoaded() {
        let data = getTriviaDataFromJSON()
        do {
            let trivia = try TriviaWrapper.getTriviaData(from: data)
            XCTAssertTrue(trivia.count == 10 )
        } catch {
            print(error)
        }
    }
    
    
    
    private func getJokeDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "Jokes", ofType: "json") else { fatalError("Couldn't find json file") }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("Couldn't get data from json file: \(jsonError)")
        }
    }
    
    private func getMovieDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "StarWars", ofType: "json") else { fatalError("Couldn't find json file") }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("Couldn't get data from json file: \(jsonError)")
        }
    }
    
    private func getTriviaDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "Trivia", ofType: "json") else { fatalError("Couldn't find json file") }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("Couldn't get data from json file: \(jsonError)")
        }
    }
}

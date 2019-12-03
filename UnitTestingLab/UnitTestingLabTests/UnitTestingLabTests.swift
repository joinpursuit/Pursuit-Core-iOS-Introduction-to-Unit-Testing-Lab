//
//  UnitTestingLabTests.swift
//  UnitTestingLabTests
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import XCTest
@testable import UnitTestingLab

class UnitTestingLabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testEP1CheckIfDataExists(){
        //Arrange
        let filename = "OfficialJoke"
        let ext = "json"

        //Act
        let data = Bundle.readjSONData(filename: filename, ext: ext)
        
        //Assert
        XCTAssertNotNil(data)
    }
    
    func testEP1CheckIfDataParsed(){
        
        //Arrange
        let filename = "OfficialJoke"
        let ext = "json"
        let data = Bundle.readjSONData(filename: filename, ext: ext)
        
        //Act
        let jokes = JokesDataModel.getJokes(from: data)
        
        //Assert
        XCTAssertGreaterThan(jokes.count, 0)
    }
    
    func testEP2CheckIfDataExists(){
        //Arrange
        let filename = "StarWars"
        let ext = "json"
        
        //Act
        let data = Bundle.readjSONData(filename: filename, ext: ext)
        
        //Assert
        XCTAssertNotNil(data)
        
    }
    
    func testEP2CheckIfDataParsed(){
        //Arrange
        let filename = "StarWars"
        let ext = "json"
        let data = Bundle.readjSONData(filename: filename, ext: ext)
        
        //Act
        let episodes = StarWarsData.getEpisodes(from: data)
        
        //Assert
        XCTAssertGreaterThan(episodes.count, 0)
    }
    
    func testEP3CheckIfDataExists(){
        //Arrange
        let filename = "Trivia"
        let ext = "json"
        
        //Act
        let data = Bundle.readjSONData(filename: filename, ext: ext)
        
        //Assert
        XCTAssertNotNil(data)
    }
    
    func testEP3CheckIfDataParsed(){
        //Arrange
        let filename = "Trivia"
        let ext = "json"
        let data = Bundle.readjSONData(filename: filename, ext: ext)

        //Act
        let questions = TriviaData.getQuestions(from: data)

        //Assert
        XCTAssertGreaterThan(questions.count, 0)
    }

}

//
//  TriviaTests.swift
//  IntroductionToUnitTestingTests
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import XCTest
@testable import IntroductionToUnitTesting

class TriviaTests: XCTestCase{
    func testGetValidURL() {
        // Arrange
        let filename = "TriviaData"
        let ext = "json"
        
        // Act
        let validURL = Bundle.main.url(forResource: filename, withExtension: ext)
        
        // Assert
        XCTAssertNotNil(validURL, "Could not access URL")
    }
    
    func testGetTriviaData(){
        // Arrange
        let filename = "TriviaData"
        let ext = "json"
        
        // Act
        let data = Trivia.getTriviaData(from: filename, with: ext)
        
        // Assert
        XCTAssertNotNil(data, "Could not retrieve data")
    }
    
    func testGetTriviaQuestions(){
        // Arrange
        let filename = "TriviaData"
        let ext = "json"
        let data = Trivia.getTriviaData(from: filename, with: ext)
        
        // Act
        let trivia = Trivia.getTriviaQuestions(using: data)
        
        // Assert
        XCTAssertGreaterThan(trivia.count, 0, "\(trivia.count) is not greater than \(0)")
    }
    
    func testIsTheDataValid() {
        // Arrange
        let filename = "TriviaData"
        let ext = "json"
        let data = Trivia.getTriviaData(from: filename, with: ext)
        let triviaQuestions = Trivia.getTriviaQuestions(using: data)
        let expectedValue = "Edgar Allan Poe"
        
        // Act
        let currentTriviaQuestion = triviaQuestions.first!
        
        // Assert
        XCTAssertEqual(currentTriviaQuestion.incorrectAnswers.first!.components(separatedBy: "%20").reduce("") { (str1: String, str2: String) -> String in
            if str1 == "" {
                return str1 + str2
            } else {
                return str1 + " " + str2
            }}, expectedValue, "\(currentTriviaQuestion.incorrectAnswers.first!.components(separatedBy: "%20").reduce("") { $0 + " " + $1}) is not equal to \(expectedValue)")
    }
}

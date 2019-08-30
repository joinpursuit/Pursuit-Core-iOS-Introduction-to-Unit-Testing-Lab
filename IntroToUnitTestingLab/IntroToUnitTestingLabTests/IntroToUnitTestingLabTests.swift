//
//  IntroToUnitTestingLabTests.swift
//  IntroToUnitTestingLabTests
//
//  Created by Sam Roman on 8/29/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import XCTest
@testable import IntroToUnitTestingLab

class IntroToUnitTestingLabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //Task 1 : Make sure data loaded and model is able to decode
    func testJokeLoaded (){
        let data = getDataFromJSON(name: "jokes")
        let testJoke = Joke.getJokes(from: data)
        XCTAssertTrue(testJoke.self != nil, "Jokes failed to load")
    
    }
    
    //gets data from respective json file depending on name parameter
    private func getDataFromJSON(name: String) -> Data {
        guard let pathToData = Bundle.main.path(forResource: name , ofType: "json") else { fatalError("couldnt find json file called \(name).json")}
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("couldnt get data from json file \(jsonError)")
        }
    }
    
    //tests
    func testJokeArrayCount() {
        let data = getDataFromJSON(name:"jokes")
        let testJoke = Joke.getJokes(from: data)
        XCTAssertTrue(testJoke.count == 10 , "Not 10 Jokes")
    }
    
    
    

    func testValuesAreCorrect(){
        let jokeData = getDataFromJSON(name:"jokes")
        let movieData = getDataFromJSON(name: "starwars")
        let triviaData = getDataFromJSON(name: "trivia")
        let testJoke = Joke.getJokes(from: jokeData)
        let testMovie = MovieList.getMovies(from: movieData).results
        let testTrivia = Trivia.getTrivia(from: triviaData).results
        for i in testJoke {
        XCTAssertTrue(i.punchline == String(i.punchline) , "punchline not a String")
        XCTAssertTrue(i.setup == String(i.setup), "setup is not a String")
        XCTAssertTrue(i.type == String(i.type), "type is not a String")
            XCTAssertTrue(i.id == Int(i.id), "id is not an Int" )
    }
        for i in testMovie {
        XCTAssertTrue(i.title == String(i.title), "title not a string")
        XCTAssertTrue(i.opening_crawl == String(i.opening_crawl), "opening crawl not a string")
        }
        for i in testTrivia {
            XCTAssert(i.category == String(i.category), "category not a string")
            XCTAssert(i.correct_answer == String(i.correct_answer), "correct_answer not a string")
            XCTAssert(i.question == String(i.question), "question not a string")
            XCTAssert(i.type == String(i.type), "type not a string")
            for n in i.incorrect_answers {
            XCTAssert(n == String(n), "incorrect answer not a string")
        }
        
    }
    }
    
    
    func testMoviesLoaded (){
        let data = getDataFromJSON(name: "starwars")
        let testMovie = MovieList.getMovies(from: data).results
        XCTAssertTrue(testMovie.self != nil, "Movies failed to load")
        
    }
    

    
    func testMovieArrayCount() {
        let data = getDataFromJSON(name: "starwars")
        let testMovie = MovieList.getMovies(from: data).results
        XCTAssertTrue(testMovie.count == 7 , "Not 7 Movies")
    }
    
    
    func testTriviaLoaded() {
        let data = getDataFromJSON(name: "trivia")
        let testTrivia = Trivia.getTrivia(from: data).results
        XCTAssertTrue(testTrivia.self != nil, "Trivia failed to load")
    }
    
    
    func testTriviaArrayCount() {
        let data = getDataFromJSON(name: "trivia")
        let testTrivia = Trivia.getTrivia(from: data).results
        XCTAssertTrue(testTrivia.count == 10, "Trivia array amount not 10")
        
    }
    
    
    
    
    
    
    
    
    

}

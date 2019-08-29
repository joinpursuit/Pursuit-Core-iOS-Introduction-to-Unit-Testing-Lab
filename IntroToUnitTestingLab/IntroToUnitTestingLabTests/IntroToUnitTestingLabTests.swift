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
        let testJoke = Joke.getJokes(from: jokeData)
        let testMovie = MovieList.getMovies(from: movieData).results
        for i in 0..<testJoke.count {
        XCTAssertTrue(testJoke[i].punchline == String(testJoke[i].punchline) , "punchline not a String")
        XCTAssertTrue(testJoke[i].setup == String(testJoke[i].setup), "setup is not a String")
        XCTAssertTrue(testJoke[i].type == String(testJoke[i].type), "type is not a String")
            XCTAssertTrue(testJoke[i].id == Int(testJoke[i].id), "id is not an Int" )
    }
        for i in 0..<testMovie.count {
        XCTAssertTrue(testMovie[i].title == String(testMovie[i].title), "title not a string")
        XCTAssertTrue(testMovie[i].opening_crawl == String(testMovie[i].opening_crawl), "opening crawl not a string")
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
    
    
//    func testMovieValuesAreCorrect(){
//        let data = getDataFromJSON(name: "starwars")
//        let testMovie = MovieList.getMovies(from: data).results
//        for i in 0..<testMovie.count {
//        XCTAssertTrue(testMovie[i].title == String(testMovie[i].title), "title not a string")
//
//        }
//    }
//
    
    
    
    
    
    
    

}

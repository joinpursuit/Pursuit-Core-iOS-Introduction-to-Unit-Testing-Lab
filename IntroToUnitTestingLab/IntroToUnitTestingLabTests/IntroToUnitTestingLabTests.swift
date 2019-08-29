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
        let data = getJokeFromJSON()
        let testJoke = Joke.getJokes(from: data)
        XCTAssertTrue(testJoke.self != nil, "Data failed to load")
    
    }
    
    
    private func getJokeFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "jokes", ofType: "json") else { fatalError("couldnt find json file called jokes.json")}
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("couldnt get data from json file \(jsonError)")
        }
    }
    
    
//    func testJokeArrayCount() {
//        let data = getJokeFromJSON()
//        let 
//    }
//    
    
    
    
    
    
    
    
    

}

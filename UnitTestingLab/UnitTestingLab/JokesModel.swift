//
//  JokesModel.swift
//  UnitTestingLab
//
//  Created by Yuliia Engman on 12/4/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import Foundation

//struct JokeData: Decodable {
//    let list = [Joke]
//}

struct Joke: Decodable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}

extension Joke {
    static func getJoke() -> [Joke] {
        var jokes = [Joke]()
        
        guard let fileURL = Bundle.main.url(forResource: "jokesAPI", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            
            let jokeData = try JSONDecoder().decode([Joke].self, from: data)
        } catch {
            fatalError("failed to load contents \(error)")
        }
        return jokes
    }
}



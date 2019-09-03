//
//  Jokes.swift
//  Unit Test Lab
//
//  Created by Michelle Cueva on 8/29/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation

struct Jokes: Codable {
    let setup: String
    let punchline: String
    
    
    static func getJokes(from data: Data) throws -> [Jokes] {
        do {
            let newJoke = try JSONDecoder().decode([Jokes].self, from: data)
            return newJoke
            
        } catch  {
            throw jsonError.decodingError(error)
        }
    }
}

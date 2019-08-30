//
//  JokeStruct.swift
//  UnitTestLabProj
//
//  Created by Kevin Natera on 8/29/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit




struct Jokes : Codable {
    let setup: String
    let punchline: String
    
    static func getJokeData(from data: Data) throws -> [Jokes] {
        do {
            let jokeData = try JSONDecoder().decode([Jokes].self, from: data)
            return jokeData
        } catch {
            throw JSONError.decodingError(error)
        }
        
    }
}





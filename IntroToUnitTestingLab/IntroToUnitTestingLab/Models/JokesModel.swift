//
//  JokesModel.swift
//  IntroToUnitTestingLab
//
//  Created by Sam Roman on 8/29/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation
import UIKit

struct Joke: Codable {
    var id: Int
    var type: String
    var setup: String
    var punchline: String
    

    
    static func getJokes(from data: Data) -> [Joke] {
        do {
            let jokes = try JSONDecoder().decode([Joke].self, from: data)
            return jokes
        } catch let decodeError {
            fatalError("could not decode info \(decodeError)")
            
        }
    }
}






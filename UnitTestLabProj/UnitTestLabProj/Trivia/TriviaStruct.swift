//
//  TriviaStruct.swift
//  UnitTestLabProj
//
//  Created by Kevin Natera on 8/29/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

enum JSONError : Error {
    case decodingError(Error)
}

struct TriviaWrapper : Codable {
    let results : [Trivia]
    
    static func getTriviaData(from data: Data) throws -> [Trivia] {
        do {
            let triviaData = try JSONDecoder().decode(TriviaWrapper.self, from: data)
            return triviaData.results
        } catch {
            throw JSONError.decodingError(error)
        }
        
    }
}


struct Trivia : Codable {
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}


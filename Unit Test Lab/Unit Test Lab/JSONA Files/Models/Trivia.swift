//
//  Trivia.swift
//  Unit Test Lab
//
//  Created by Michelle Cueva on 8/29/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation

enum jsonError: Error {
    case decodingError(Error)
}
struct TriviaWrapper: Codable {
    let results: [Trivia]
    
    static func getTrivia(from data: Data) -> TriviaWrapper? {
        do {
            let newTrivia = try JSONDecoder().decode(TriviaWrapper.self, from: data)
            return newTrivia
            
        } catch {
         return nil
        }
    }
    
    struct Trivia: Codable {
        let question: String
        private let correct_answer: String
        private let incorrect_answers:[String]
        
        func getCleanCorrectString()-> String {
            return correct_answer.removingPercentEncoding ?? "EmptyString"
        }
        
        func getCleanIncorrectArr() -> [String] {
            var arr = [String]()
            for str in incorrect_answers {
                guard let cleanString = str.removingPercentEncoding else {break}
                arr.append(cleanString)
            }
            return arr
        }
        
    }
    
   
}
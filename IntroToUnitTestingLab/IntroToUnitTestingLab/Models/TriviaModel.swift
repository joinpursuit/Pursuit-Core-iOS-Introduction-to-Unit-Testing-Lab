//
//  TriviaModel.swift
//  IntroToUnitTestingLab
//
//  Created by Sam Roman on 8/29/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation
import UIKit


struct Trivia : Codable {
    var results: [Question]
    
    static func getTrivia(from data: Data) -> Trivia {
        do {
            let trivia = try JSONDecoder().decode(Trivia.self, from: data)
            return trivia
        } catch let decodeError {
            fatalError("could not decode info \(decodeError)")
            
        }
    }
}



struct Question: Codable {
    var category: String
    var type: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
    
    func allAnswers() -> [String]{
        var all = incorrect_answers
        all.append(correct_answer)
        return all
    }
}



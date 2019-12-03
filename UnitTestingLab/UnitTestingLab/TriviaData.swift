//
//  TriviaData.swift
//  UnitTestingLab
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import Foundation

struct TriviaData: Decodable {
    var results : [Trivia]
}

struct Trivia: Decodable {
    var question = String().removingPercentEncoding
    var correct_answer: String
    var incorrect_answers: [String]
}

extension Trivia{
    static func getQuestions(from data: Data) -> [Trivia]{
        var questions = [Trivia]()
        do{
            let questionsData = try JSONDecoder().decode(TriviaData.self, from: data)
            questions = questionsData.results
        }catch{
            fatalError("failed to decode. err \(error)")
        }
        
        return questions
    }
}

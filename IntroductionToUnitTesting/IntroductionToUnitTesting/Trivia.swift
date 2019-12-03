//
//  Trivia.swift
//  IntroductionToUnitTesting
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

struct Trivia: Decodable{
    var results: [TriviaQuestion]
}

struct TriviaQuestion: Decodable{
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey{
        case category
        case type
        case difficulty
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

extension Trivia{
    static func getTriviaData(from file: String, with ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: file, withExtension: ext) else{
            fatalError("Could not create file URL from \(file)\(ext)")
        }
        
        var data = Data()
        do{
            data = try Data.init(contentsOf: fileURL)
        } catch {
            print("Encountered Error \(error)")
        }
        return data
    }
    
    static func getTriviaQuestions(using data: Data) -> [TriviaQuestion] {
        var triviaQuestions = [TriviaQuestion]()
        
        do {
            let triviaData = try JSONDecoder().decode(Trivia.self, from: data)
            triviaQuestions = triviaData.results
        } catch {
            print("Encountered Error: \(error)")
        }
        return triviaQuestions
    }
}

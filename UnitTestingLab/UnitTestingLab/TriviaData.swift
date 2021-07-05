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
    var question: String //.removingPercentEncoding
    var correctAnswer: String
    var incorrectAnswers: [String]
    var type: String
    
    private enum CodingKeys: String, CodingKey{
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
        case type
    }
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
    
    func removePercentEncoding(encodedString: String) -> String{
        guard let validString = encodedString.removingPercentEncoding else {
            return ""
        }
        return validString
    }
    
    func removePercentEncoding(encodedStringArr: [String]) -> [String]{
        var tempArr = [String]()
        encodedStringArr.forEach { (str) in
            guard let validStr = str.removingPercentEncoding else {
                return
            }
            tempArr.append(validStr)
        }
        return tempArr
    }
    
    func getAllPossibleAnswers() -> [String]{
        var tempArr = [String]()
        tempArr.append(self.correctAnswer)
        tempArr.append(contentsOf: self.incorrectAnswers)
        tempArr.forEach { (str) in
            guard let validStr = str.removingPercentEncoding else {
                return
            }
            tempArr.removeFirst()
            tempArr.append(validStr)
        }
        tempArr.shuffle()
        return tempArr
        
    }
    
    func checkType() -> String {
        return self.type
    }
    
    func isTypeBoolean() -> Bool {
        return self.type == "boolean"
    }
    
    func appendBooleanValues() -> [String]{
        var tempArr = [String]()
        if self.type == "boolean" {
            tempArr.append(self.correctAnswer)
            tempArr.append(contentsOf: self.incorrectAnswers)
        }
        return tempArr
    }
    
    func joinAllPossibleAnswersAsString() -> String{
        var tempArr = [String]()
        tempArr.append(self.correctAnswer)
        tempArr.append(contentsOf: self.incorrectAnswers)
        tempArr.forEach { (str) in
            guard let validStr = str.removingPercentEncoding else {
                return
            }
            tempArr.removeFirst()
            tempArr.append(validStr)
        }
        tempArr.shuffle()
        
        let str = tempArr.joined(separator: "\n")
        return str
    }
    
}

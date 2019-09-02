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
    
    static func getTrivia(from data: Data) throws -> [Trivia] {
        do {
            let newTrivia = try JSONDecoder().decode(TriviaWrapper.self, from: data)
            return newTrivia.results
            
        } catch {
            throw jsonError.decodingError(error)
        }
    }
    
}

struct Trivia: Codable {
    let question: String
    private let correct_answer: String
    private let incorrect_answers:[String]
    let type: String
    
    func getCleanQuestionString()-> String {
        return question.removingPercentEncoding ?? "EmptyString"
    }
    
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
    
    func getAllOptions() -> [String] {
        var arr = [String]()
        if self.type == "boolean" {
            arr = ["True", "False"]
        } else {
            for str in getCleanIncorrectArr() {
                arr.append(str)
            }
            arr.append(getCleanCorrectString())
            arr.shuffle()
        }
        return arr
    }
    
}

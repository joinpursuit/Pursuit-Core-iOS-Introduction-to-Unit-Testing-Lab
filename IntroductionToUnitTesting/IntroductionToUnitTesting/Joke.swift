//
//  Joke.swift
//  IntroductionToUnitTesting
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

struct Joke: Codable{
    var id: Int
    var type: String
    var setup: String
    var punchline: String
}

extension Joke{
    static func getData(from file: String, with ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: file, withExtension: ext) else{
            fatalError("Could not access url")
        }
        
        var data = Data()
        
        do {
            data = try Data.init(contentsOf: fileURL)
        } catch {
            print("Encountered an error: \(error)")
        }
        return data
    }
    
    static func getJokes(using data: Data) -> [Joke]{
        var jokes = [Joke]()
        do {
            jokes = try JSONDecoder().decode([Joke].self, from: data)
        } catch {
            print("Encountered error: \(error)")
        }
        return jokes
    }
}

//
//  JokesDataModel.swift
//  UnitTestingLab
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import Foundation

struct JokesDataModel:Decodable{
    var setup:String
    var punchline:String
}

extension JokesDataModel{
    static func getJokes(from data: Data) -> [JokesDataModel]{
        var jokes = [JokesDataModel]()
        do{
            let jokesData = try JSONDecoder().decode([JokesDataModel].self, from: data)
            jokes = jokesData
        } catch{
            fatalError("decoding error \(error)")
        }
        return jokes
    }
}

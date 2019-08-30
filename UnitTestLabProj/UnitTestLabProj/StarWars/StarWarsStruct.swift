//
//  StarWarsStruct.swift
//  UnitTestLabProj
//
//  Created by Kevin Natera on 8/29/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit



struct StarWarsWrapper : Codable {
    let results: [StarWars]
    
    static func getMovieData(from data: Data) throws -> [StarWars] {
        do {
            let movieData = try JSONDecoder().decode(StarWarsWrapper.self, from: data)
            return movieData.results
        } catch {
            throw JSONError.decodingError(error)
        }
        
    }
}

struct StarWars : Codable {
    let title: String
    let opening_crawl: String
}

//
//  StarWars.swift
//  Unit Test Lab
//
//  Created by Michelle Cueva on 8/29/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation

struct StarWarsWrapper: Codable {
    let results: [StarWars]
    
    static func getStarWars(from data: Data) throws -> [StarWars] {
        do {
            let newStarWars = try JSONDecoder().decode(StarWarsWrapper.self, from: data)
            return newStarWars.results
            
        } catch {
            throw jsonError.decodingError(error)
        }
    }
    
}

struct StarWars: Codable {
    let title: String
    let opening_crawl: String
}


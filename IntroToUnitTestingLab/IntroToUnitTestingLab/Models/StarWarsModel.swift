//
//  StarWarsModel.swift
//  IntroToUnitTestingLab
//
//  Created by Sam Roman on 8/29/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import Foundation
import UIKit


struct MovieList: Codable {
    var results: [Movies]
    
    static func getMovies(from data: Data) -> MovieList {
        do {
            let movies = try JSONDecoder().decode(MovieList.self, from: data)
            return movies
        } catch let decodeError {
            fatalError("could not decode info \(decodeError)")
            
        }
    }
}

struct Movies: Codable {
    var title: String
    var opening_crawl: String
}


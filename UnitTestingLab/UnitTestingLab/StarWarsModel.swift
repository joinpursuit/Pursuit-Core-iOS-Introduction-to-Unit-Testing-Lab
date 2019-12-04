//
//  StarWarsModel.swift
//  UnitTestingLab
//
//  Created by Yuliia Engman on 12/4/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import Foundation

struct MovieData: Decodable {
    let results: [Episode]
}


struct Episode: Decodable {
    let title: String
    let crawl: String
    //opening_crawl: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case crawl = "opening_crawl"
    }
}

extension MovieData {
    static func getEpisodes(from data: Data) -> [Episode] {
        var movies = [Episode]()
        
        guard let fileURL = Bundle.main.url(forResource: "starWars", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            
            let movieInfo = try JSONDecoder().decode(MovieData.self, from: data)
            movies = movieInfo.results
        } catch {
            fatalError("failed to load contents \(error)")
        }
        return movies
    }
}


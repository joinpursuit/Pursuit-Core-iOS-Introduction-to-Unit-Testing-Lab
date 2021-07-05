//
//  StarWarsData.swift
//  UnitTestingLab
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import Foundation

struct StarWarsData: Decodable {
    var results: [Episode]
}

struct Episode: Decodable {
    var title:String
    var openingCrawl: String
    
    private enum CodingKeys: String, CodingKey{
        case title
        case openingCrawl = "opening_crawl"
    }
}

extension StarWarsData{
    static func getEpisodes(from data: Data) -> [Episode]{
        var episodes = [Episode]()
        do{
            let episodesData = try JSONDecoder().decode(StarWarsData.self, from: data)
            episodes = episodesData.results
        } catch{
            fatalError("failed to decode. error \(error)")
        }
        
        return episodes
    }
}

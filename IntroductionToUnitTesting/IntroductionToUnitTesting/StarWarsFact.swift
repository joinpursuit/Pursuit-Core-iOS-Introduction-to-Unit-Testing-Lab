//
//  StarWars.swift
//  IntroductionToUnitTesting
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

struct StarWarsFact: Decodable{
    var results: [StarWarsMovie]
}

struct StarWarsMovie: Decodable{
    var title: String
    var episodeId: Int
    var openingCrawl: String
    var director: String
    var producer: String
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey{
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
    }
}

extension StarWarsFact{
    static func getData(from file: String, with ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: file, withExtension: ext) else {
            fatalError("Could not find create a valid URL.")
        }
        
        var data = Data()
        
        do{
            data = try Data.init(contentsOf: fileURL)
        } catch {
            print("Encountered error: \(error)")
        }
        return data
    }
    
    static func getStarWarsFacts(using data: Data) -> [StarWarsMovie] {
        var theFacts = [StarWarsMovie]()
        
        do{
            let decodedData = try JSONDecoder().decode(StarWarsFact.self, from: data)
            theFacts = decodedData.results
        } catch {
            print("Encountered error: \(error)")
        }
        return theFacts
    }
}

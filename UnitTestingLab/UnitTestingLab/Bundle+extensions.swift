//
//  Bundle+extensions.swift
//  UnitTestingLab
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import Foundation

extension Bundle {
    static func readjSONData(filename: String, ext: String) -> Data{
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("Resource with filename \(filename) not found in bundle")
        }
        
        var data: Data!
        
        do{
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("contents not found error: \(error)")
        }
        
        return data
    }
}

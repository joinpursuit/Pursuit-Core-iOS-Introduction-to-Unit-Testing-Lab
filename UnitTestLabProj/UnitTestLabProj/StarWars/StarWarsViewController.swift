//
//  StarWarsViewController.swift
//  UnitTestLabProj
//
//  Created by Kevin Natera on 8/29/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

class StarWarsViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movies = [StarWars]()
    
    @IBOutlet weak var starWarsTableOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = starWarsTableOutlet.dequeueReusableCell(withIdentifier: "movie")
        
        cell?.textLabel?.text = movies[indexPath.row].title
        
        return cell!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let SWDetailVC = segue.destination as? SWDetailViewController else { fatalError()}
        
        SWDetailVC.movie = movies[starWarsTableOutlet.indexPathForSelectedRow!.row]
    }
    
    
    
    private func LoadData() {
        guard let pathToData = Bundle.main.path(forResource: "StarWars", ofType: "json") else { fatalError("Couldn't find json file") }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            let movieDataFromJSON = try StarWarsWrapper.getMovieData(from: data)
            movies = movieDataFromJSON
        } catch let jsonError {
            fatalError("Couldn't get data from json file: \(jsonError)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starWarsTableOutlet.delegate = self
        starWarsTableOutlet.dataSource = self
        LoadData()
    }
}

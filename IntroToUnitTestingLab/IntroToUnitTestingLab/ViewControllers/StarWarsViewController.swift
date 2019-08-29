//
//  ViewController.swift
//  IntroToUnitTestingLab
//
//  Created by Sam Roman on 8/29/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movies: [Movies]!
    
    @IBOutlet weak var movieTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        return cell
    }
    
    private func loadData() {
        //pathToJSONFile is just the string for the name of the file
        guard let pathToJSONFile = Bundle.main.path(forResource: "starwars", ofType: "json") else {
            fatalError("Could not find bundle")
        }
        print(pathToJSONFile)
        //url is the reference of the location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let resultsFromJSON = MovieList.getMovies(from: data).results
            movies = resultsFromJSON
            
        } catch {
            fatalError("Could not decode")
        }
    }
    
    

    override func viewDidLoad() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        loadData()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


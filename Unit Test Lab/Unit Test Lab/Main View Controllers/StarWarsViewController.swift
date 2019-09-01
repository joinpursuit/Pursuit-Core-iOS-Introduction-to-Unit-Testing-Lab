//
//  StarWarsViewController.swift
//  Unit Test Lab
//
//  Created by Michelle Cueva on 9/1/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    var movies = [StarWars]() {
        didSet {
            starWarsTableView.reloadData()
        }
    }

    @IBOutlet weak var starWarsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
        
    }
    
    private func configureTableView() {
        starWarsTableView.dataSource = self
        starWarsTableView.delegate = self
        starWarsTableView.tableFooterView = UIView()
    }
    
    private func loadData() {
        guard let pathToStarWarsFile = Bundle.main.path(forResource: "Star Wars API", ofType: "json") else {fatalError("Couldn't find file")}
        
        let url = URL(fileURLWithPath: pathToStarWarsFile)
        
        do {
            let data = try
                Data(contentsOf: url)
            let StarWarsFromJSON = try
                StarWarsWrapper.getStarWars(from: data)
                movies = StarWarsFromJSON
        } catch {
            fatalError("Couldn't get Star Wars from JSON \(error)")
        }
    }
        
}

extension StarWarsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
        let currentMovie = movies[indexPath.row]
        cell.textLabel?.text = currentMovie.title
        return cell
    }
}

extension StarWarsViewController: UITableViewDelegate {
    
}



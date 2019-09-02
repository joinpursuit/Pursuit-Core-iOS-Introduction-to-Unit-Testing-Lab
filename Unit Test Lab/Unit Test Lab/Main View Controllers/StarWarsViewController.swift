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
        starWarsTableView.rowHeight = 75
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier  else {fatalError("No identifier in segue")}
        
        switch segueIdentifier {
        case "starWarsSegue":
            guard let DetailVC = segue.destination as? StarWarsDetailViewController else {fatalError("unexpected segue VC")}
            guard let selectedIndexPath = starWarsTableView.indexPathForSelectedRow else {fatalError("no row selected")}
            
            let currentMovie = movies[selectedIndexPath.row]
            DetailVC.movie = currentMovie
        default:
            fatalError("unexpected segue identifier")
        }
        
    }
}

extension StarWarsViewController: UITableViewDelegate {
    
}



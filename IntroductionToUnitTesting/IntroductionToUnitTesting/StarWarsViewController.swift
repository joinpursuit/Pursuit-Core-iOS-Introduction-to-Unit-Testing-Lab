//
//  StarWarsViewController.swift
//  IntroductionToUnitTesting
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {

    @IBOutlet weak var starWarsMovieTableView: UITableView!
    
    var starWarsMovies = [StarWarsMovie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        starWarsMovieTableView.delegate = self
        starWarsMovieTableView.dataSource = self
    }
    
    private func setUp() {
        let filename = "StarWarsData"
        let ext = "json"
        starWarsMovies = StarWarsFact.getStarWarsFacts(using: StarWarsFact.getData(from: filename, with: ext))
    }

}

extension StarWarsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "starCell", for: indexPath)
        xCell.textLabel?.text = starWarsMovies[indexPath.row].title
        xCell.textLabel?.numberOfLines = 0
        return xCell
    }
}

extension StarWarsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newStoryboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        guard let detailedStarWarsVC = newStoryboard.instantiateViewController(identifier: "detailedStarWarsVC") as? DetailedStarWarsViewController else {
            fatalError("Could not create instance of Detailed Star Wars View Controller")
        }
        detailedStarWarsVC.currentStarWarsMovie = starWarsMovies[indexPath.row]
        navigationController?.pushViewController(detailedStarWarsVC, animated: true)
    }
}

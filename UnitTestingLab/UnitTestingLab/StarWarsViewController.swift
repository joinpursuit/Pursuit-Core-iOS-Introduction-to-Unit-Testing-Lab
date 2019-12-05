//
//  StarWarsViewController.swift
//  UnitTestingLab
//
//  Created by Yuliia Engman on 12/4/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var episodes = [Episode](){
        didSet {
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        let fileNameWars = "starWars"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: fileNameWars, ext: ext)
        episodes = MovieData.getEpisodes(from: data)
    }
}

extension StarWarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
        
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
}
//
//var jokes = [Joke]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        loadData()
//    }
//
//    func loadData() {
//        let filename = "jokesAPI"
//        let ext = "json"
//        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
//        jokes = Joke.getJoke(from: data)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let detailJokeVC = segue.destination as? DetailJokesViewController, let indexPath = tableView.indexPathForSelectedRow else {
//            fatalError("verify class name in identity inspector")
//        }
//        let joke = jokes[indexPath.row]
//
//        detailJokeVC.someJoke = joke
//    }
//

    

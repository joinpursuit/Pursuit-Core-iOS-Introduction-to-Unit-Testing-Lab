//
//  ViewController.swift
//  UnitTestingLab
//
//  Created by Yuliia Engman on 12/3/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class JokesMainViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var jokes = [Joke]() {
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
        let filename = "jokesAPI"
        let ext = "json"
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        jokes = Joke.getJoke(from: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailJokeVC = segue.destination as? DetailJokesViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("verify class name in identity inspector")
        }
        let joke = jokes[indexPath.row]
        
        detailJokeVC.someJoke = joke
    }


}


extension JokesMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        
        let joke = jokes[indexPath.row]
        cell.textLabel?.text = joke.setup
        return cell
    }
}
    





//
//  JokesViewController.swift
//  Unit Test Lab
//
//  Created by Michelle Cueva on 9/1/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {
    
    var jokes = [Jokes]() {
        didSet {
            jokesTableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var jokesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateTableView()
        loadJokesInfo()
    }
    
    func configurateTableView() {
        jokesTableView.delegate = self
        jokesTableView.dataSource = self
        jokesTableView.tableFooterView = UIView()
    }
    
    func loadJokesInfo() {
        
        guard let pathToJokeFile = Bundle.main.path(forResource: "jokesAPI", ofType: "json") else {fatalError("Couldn't find file")}
        
        let url = URL(fileURLWithPath: pathToJokeFile)
        
        do {
            let data = try
                Data(contentsOf: url)
            let jokesFromJSON = Jokes.getJokes(from: data)
            jokes = jokesFromJSON
            
        } catch {
            fatalError("Couldn't get jokes from JSON \(error)")
        }
    }
}

extension JokesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        let currentJoke = jokes[indexPath.row]
        cell.textLabel?.text = currentJoke.setup
        return cell
    }
    
    
}

extension JokesViewController: UITableViewDelegate {
    
}

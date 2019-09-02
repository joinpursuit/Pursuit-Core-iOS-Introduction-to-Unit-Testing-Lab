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
    
    private func configurateTableView() {
        jokesTableView.delegate = self
        jokesTableView.dataSource = self
        jokesTableView.rowHeight = 75
        jokesTableView.tableFooterView = UIView()
    }
    
    private func loadJokesInfo() {
        
        guard let pathToJokeFile = Bundle.main.path(forResource: "jokesAPI", ofType: "json") else {fatalError("Couldn't find file")}
        
        let url = URL(fileURLWithPath: pathToJokeFile)
        
        do {
            let data = try
                Data(contentsOf: url)
            
            let jokesFromJSON = try
                Jokes.getJokes(from: data)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {fatalError("No identifier in segue")}
        
        switch segueIdentifier {
        case "jokeSegue":
            guard let DetailVC = segue.destination as? JokesDetailViewController else {fatalError("unexpected segueVC")}
            
            guard let selectedIndexPath = jokesTableView.indexPathForSelectedRow else {fatalError("no row selected")}
            let currentJoke = jokes[selectedIndexPath.row]
            DetailVC.jokes = currentJoke
        default:
            fatalError("unexpected segue")
        }
    }
    
}

extension JokesViewController: UITableViewDelegate {
    
}

//
//  ViewController.swift
//  UnitTestLabProj
//
//  Created by Kevin Natera on 8/29/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var jokes = [Jokes]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jokeTableOutlet.dequeueReusableCell(withIdentifier: "joke")
        
        cell?.textLabel?.text = jokes[indexPath.row].setup
        
        return cell!
    }
    
    @IBOutlet weak var jokeTableOutlet: UITableView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let punchLineVC = segue.destination as? PunchLineViewController else { fatalError()}
        
        punchLineVC.joke = jokes[jokeTableOutlet.indexPathForSelectedRow!.row]
    }
    
    
    
    
    private func LoadData() {
        guard let pathToData = Bundle.main.path(forResource: "Jokes", ofType: "json") else { fatalError("Couldn't find json file") }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            let jokeDataFromJSON = try Jokes.getJokeData(from: data)
            jokes = jokeDataFromJSON
        } catch let jsonError {
            fatalError("Couldn't get data from json file: \(jsonError)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokeTableOutlet.delegate = self
        jokeTableOutlet.dataSource = self
        LoadData()
    }


}


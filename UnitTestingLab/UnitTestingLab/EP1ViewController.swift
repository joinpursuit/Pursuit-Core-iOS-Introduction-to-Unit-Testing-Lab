//
//  ViewController.swift
//  UnitTestingLab
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP1ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var jokes = [JokesDataModel](){
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        tableView.dataSource = self
    }
    
    func loadData(){
        let filename = "OfficialJoke"
        let ext = "json"
        let data = Bundle.readjSONData(filename: filename, ext: ext)
        jokes = JokesDataModel.getJokes(from: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ep1DVC = segue.destination as? EP1DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("failed to segue")
        }
        let joke = jokes[indexPath.row]
        
        ep1DVC.passedJokesObj = joke
    }

}

extension EP1ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ep1Cell", for: indexPath)
        let joke = jokes[indexPath.row]
        
        cell.textLabel?.text = joke.setup
        return cell
    
    }
}

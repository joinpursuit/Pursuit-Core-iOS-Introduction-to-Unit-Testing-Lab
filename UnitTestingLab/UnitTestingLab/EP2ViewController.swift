//
//  EP2ViewController.swift
//  UnitTestingLab
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP2ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var episodes = [Episode](){
        didSet{
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        loadData()
        super.viewDidLoad()
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let filename = "StarWars"
        let ext = "json"
        let data = Bundle.readjSONData(filename: filename, ext: ext)
        episodes = StarWarsData.getEpisodes(from: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ep2DVC = segue.destination as? EP2DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("failed to segue")
        }
        
        let episode = episodes[indexPath.row]
        
        ep2DVC.episode = episode
    }

}

extension EP2ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ep2Cell", for: indexPath)
        let episode = episodes[indexPath.row]
        
        cell.textLabel?.text = episode.title
        return cell
    }
}

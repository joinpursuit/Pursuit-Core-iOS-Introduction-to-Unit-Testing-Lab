//
//  JokesViewController.swift
//  IntroToUnitTestingLab
//
//  Created by Sam Roman on 8/29/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var jokes = [Joke]() {
        didSet {
            jokesTableView.reloadData()
        }
    }
    
    @IBOutlet weak var jokesTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jokesTableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        cell.textLabel?.text = jokes[indexPath.row].setup
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    private func loadData() {
        //pathToJSONFile is just the string for the name of the file
        guard let pathToJSONFile = Bundle.main.path(forResource: "jokes", ofType: "json") else {
            fatalError("Could not find bundle")
        }
        print(pathToJSONFile)
        //url is the reference of the location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let resultsFromJSON = Joke.getJokes(from: data)
            jokes = resultsFromJSON
            
        } catch {
            fatalError("Could not decode")
        }
    }

    override func viewDidLoad() {
        jokesTableView.delegate = self
        jokesTableView.dataSource = self
        loadData()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

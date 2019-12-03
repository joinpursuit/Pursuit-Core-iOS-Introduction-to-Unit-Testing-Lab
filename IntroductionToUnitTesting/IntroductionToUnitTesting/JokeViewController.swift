//
//  JokeViewController.swift
//  IntroductionToUnitTesting
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {

    @IBOutlet weak var jokeTableView: UITableView!
    
    var jokes = [Joke]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        jokeTableView.delegate = self
        jokeTableView.dataSource = self
    }

    private func setUp(){
        let filename = "JokeData"
        let ext = "json"
        jokes = Joke.getJokes(using: Joke.getData(from: filename, with: ext))
    }
}

extension JokeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        xCell.textLabel?.text = jokes[indexPath.row].setup
        xCell.textLabel?.numberOfLines = 0
        return xCell
    }
}

extension JokeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newStoryboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        guard let detailJokeVC = newStoryboard.instantiateViewController(identifier: "detailJokeVC") as? DetailJokeViewController else {
            fatalError("Could not create an instance of Detail Joke View Controller.")
        }
        detailJokeVC.currentJoke = jokes[indexPath.row]
        navigationController?.pushViewController(detailJokeVC, animated: true)
    }
}

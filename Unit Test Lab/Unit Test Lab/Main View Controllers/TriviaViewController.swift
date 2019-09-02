//
//  TriviaViewController.swift
//  Unit Test Lab
//
//  Created by Michelle Cueva on 9/1/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {
    
    var trivia = [Trivia]() {
        didSet {
            triviaTableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var triviaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()

    }
    
    private func configureTableView() {
        triviaTableView.dataSource = self
        triviaTableView.delegate = self
        triviaTableView.rowHeight = 80
        triviaTableView.tableFooterView = UIView()
    }
    
    private func loadData() {
        guard let pathToTriviaFile = Bundle.main.path(forResource: "Trivia API", ofType: "json") else {fatalError("Couldn't find files")}
        
        let url = URL(fileURLWithPath: pathToTriviaFile)
        
        do {
            let data = try
                Data(contentsOf: url)
            let triviaFromJSON = try
                TriviaWrapper.getTrivia(from: data)
            trivia = triviaFromJSON
        } catch {
            fatalError("Couldn't get trivia from JSON \(error)")
        }
    }

}
extension TriviaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trivia.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        let currentTrivia = trivia[indexPath.row]
        cell.textLabel?.text = currentTrivia.getCleanQuestionString()
        return cell
    }
    
    
}

extension TriviaViewController: UITableViewDelegate {
    
}



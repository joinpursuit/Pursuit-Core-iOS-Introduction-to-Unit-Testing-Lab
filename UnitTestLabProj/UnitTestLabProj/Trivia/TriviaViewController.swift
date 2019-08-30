//
//  TriviaViewController.swift
//  UnitTestLabProj
//
//  Created by Kevin Natera on 8/29/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

class TriviaViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var questions = [Trivia]()
    
    @IBOutlet weak var triviaTableOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = triviaTableOutlet.dequeueReusableCell(withIdentifier: "trivia")
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = questions[indexPath.row].question.removingPercentEncoding
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let answerVC = segue.destination as? AnswerViewController else { fatalError() }
        
        answerVC.trivia = questions[triviaTableOutlet.indexPathForSelectedRow!.row]
    }
    
    
    
    
    private func LoadData() {
        guard let pathToData = Bundle.main.path(forResource: "Trivia", ofType: "json") else { fatalError("Couldn't find json file") }
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            let triviaDataFromJSON = try TriviaWrapper.getTriviaData(from: data)
            questions = triviaDataFromJSON
        } catch let jsonError {
            fatalError("Couldn't get data from json file: \(jsonError)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        triviaTableOutlet.delegate = self
        triviaTableOutlet.dataSource = self
        triviaTableOutlet.rowHeight = 100
        LoadData()
    }
}

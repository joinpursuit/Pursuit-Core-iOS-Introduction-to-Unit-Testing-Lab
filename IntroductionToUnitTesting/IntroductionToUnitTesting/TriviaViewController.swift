//
//  ViewController.swift
//  IntroductionToUnitTesting
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var scoreDisplayButton: UIBarButtonItem!
    @IBOutlet weak var triviaTableView: UITableView!
    
    var triviaQuestions = [TriviaQuestion]()
    var totalScore = 0
    var removeChars = CharacterSet(charactersIn: "%1234567890C")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        triviaTableView.delegate = self
        triviaTableView.dataSource = self
    }

    private func setUp(){
        let filename = "TriviaData"
        let ext = "json"
        triviaQuestions = Trivia.getTriviaQuestions(using: Trivia.getTriviaData(from: filename, with: ext))
        scoreDisplayButton.title = "Score: \(totalScore)"
    }
    
    @IBAction func returnScore(unwindSegue: UIStoryboardSegue){
        guard let sourceSegue = unwindSegue.source as? DetailedTriviaViewController else {
            print("Could not find source segue")
            return
        }
        if sourceSegue.answeredCorrectly {
            totalScore += 1
            scoreDisplayButton.title = "Score: \(totalScore)"
        } 
    }

}

extension TriviaViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return triviaQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        xCell.textLabel?.text = triviaQuestions[indexPath.row].question.components(separatedBy: removeChars).filter {$0.count > 1}.reduce("") { (str1: String, str2: String) in
            if str1 == ""{
                return str1 + str2
            } else {
                return str1 + " " + str2
            }
        }
        xCell.textLabel?.numberOfLines = 0
        return xCell
    }
}

extension TriviaViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newStoryboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        guard let detailedTriviaVC = newStoryboard.instantiateViewController(identifier: "detailedTriviaVC") as? DetailedTriviaViewController else {
            fatalError("Could not create an instance of DetailedTriviaViewController.")
        }
        detailedTriviaVC.currentTriviaQuestion = triviaQuestions[indexPath.row]
        navigationController?.pushViewController(detailedTriviaVC, animated: true)
        tableView.cellForRow(at: indexPath)?.isUserInteractionEnabled = false
    }
    
}


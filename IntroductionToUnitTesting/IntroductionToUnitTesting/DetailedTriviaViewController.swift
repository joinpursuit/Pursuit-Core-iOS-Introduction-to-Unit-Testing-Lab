//
//  DetailedTriviaViewController.swift
//  IntroductionToUnitTesting
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class DetailedTriviaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var answers = [String]()
    var currentTriviaQuestion: TriviaQuestion?
    var trueAnswer: String = ""
    var answeredCorrectly = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setUp(){
        guard let curTrivia = currentTriviaQuestion else {
            fatalError("Encountered a value of nil when trying to unwrap current trivia question")
        }
        
        let trueAnswerIndex = Int.random(in: 0...3)
        
        for element in 0..<curTrivia.incorrectAnswers.count{
            answers.append(curTrivia.incorrectAnswers[element].components(separatedBy: "%20").reduce("") { (str1: String, str2: String) -> String in
                if str1 == "" {
                    return str1 + str2
                } else {
                    return str1 + " " + str2
                }
            })
        }
         trueAnswer = curTrivia.correctAnswer.components(separatedBy: "%20").reduce(""){ (str1: String, str2: String) -> String in
             if str1 == ""{
                 return str1 + str2
             } else {
                 return str1 + " " + str2
             }
         }
        
        answers.insert(trueAnswer, at: trueAnswerIndex)
    }
}

extension DetailedTriviaViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath)
        xCell.textLabel?.text = answers[indexPath.row]
        xCell.textLabel?.numberOfLines = 0
        return xCell
    }
}

extension DetailedTriviaViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if trueAnswer == answers[indexPath.row]{
            view.backgroundColor = .green
            answeredCorrectly = true
            tableView.isUserInteractionEnabled = false
        } else {
            view.backgroundColor = .red
            tableView.isUserInteractionEnabled = false
        }
    }
}

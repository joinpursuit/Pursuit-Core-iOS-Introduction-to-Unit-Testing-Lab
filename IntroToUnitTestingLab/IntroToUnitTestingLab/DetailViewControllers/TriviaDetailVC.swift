//
//  TriviaDetailVC.swift
//  IntroToUnitTestingLab
//
//  Created by Sam Roman on 8/30/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class TriviaDetailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var answers: Question!
    
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var answerOutlet: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.allAnswers().count
//        switch answers.type {
//        case "Boolean" :
//            return 2
//        case "Multiple" :
//        return answers.allAnswers().count
//        default:
//            return 4
//        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = answerOutlet.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath)
        cell.textLabel?.text = answers.allAnswers()[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    override func viewDidLoad() {
        answerOutlet.delegate = self
        answerOutlet.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.isUserInteractionEnabled = false
        let selected = answers.allAnswers()[indexPath.row]
        if selected == answers.correct_answer {
            view.backgroundColor = UIColor.green
            labelOutlet.isHidden = false
            labelOutlet.text = "CORRECT!"
        } else if selected != answers.correct_answer {
            view.backgroundColor = UIColor.red
            labelOutlet.isHidden = false
            labelOutlet.text = "WRONG!"
        
        }
        
        
        
        
    }
}



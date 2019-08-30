//
//  AnswerViewController.swift
//  UnitTestLabProj
//
//  Created by Kevin Natera on 8/29/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit


class AnswerViewController : UIViewController {
    
    var trivia: Trivia!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var incorrectOutlet1: UIButton!
    
    @IBOutlet weak var incorrectOutlet2: UIButton!
    
    @IBOutlet weak var correctOutlet: UIButton!
    
    @IBOutlet weak var incorrectOutlet3: UIButton!
    
    
    
    @IBAction func incorrectButtonPressed(_ sender: UIButton) {
        disableButtons()
        hideIncorrectAnswers()
        view.backgroundColor = UIColor.red
        questionLabel.text = "Incorrect. The correct answer is '\(trivia.correct_answer.removingPercentEncoding!)'"
    }
    
    @IBAction func correctButtonPressed(_ sender: UIButton) {
        disableButtons()
        hideIncorrectAnswers()
        view.backgroundColor = UIColor.green
        questionLabel.text = "CORRECT!"
    }
    
    private func disableButtons() {
        incorrectOutlet1.isEnabled = false
        incorrectOutlet2.isEnabled = false
        incorrectOutlet3.isEnabled = false
        correctOutlet.isEnabled = false
    }
    
    private func hideIncorrectAnswers() {
        incorrectOutlet1.isHidden = true
        incorrectOutlet2.isHidden = true
        incorrectOutlet3.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
questionLabel.text = trivia.question.removingPercentEncoding
 
correctOutlet.setTitle(trivia.correct_answer.removingPercentEncoding, for: .normal)

incorrectOutlet1.setTitle(trivia.incorrect_answers[0].removingPercentEncoding, for: .normal)
        
incorrectOutlet2.setTitle(trivia.incorrect_answers[1].removingPercentEncoding, for: .normal)

incorrectOutlet3.setTitle(trivia.incorrect_answers[2].removingPercentEncoding, for: .normal)
    }
}

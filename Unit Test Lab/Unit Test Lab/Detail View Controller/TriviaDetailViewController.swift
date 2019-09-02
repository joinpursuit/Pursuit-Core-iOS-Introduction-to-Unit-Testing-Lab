//
//  TriviaDetailViewController.swift
//  Unit Test Lab
//
//  Created by Michelle Cueva on 9/1/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class TriviaDetailViewController: UIViewController {
    
    var trivia: Trivia!
    var answerOptions:[String]!
    

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var allOptionsButtons: [UIButton]!
    
    @IBAction func ButtonsPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == trivia.getCleanCorrectString() {
            view.backgroundColor = UIColor.green
        } else {
            view.backgroundColor = UIColor.red
        }
        disableButtons()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = trivia.getCleanQuestionString()
        loadIfTypeBool(Type: trivia.type == "boolean")
        answerOptions = trivia.getAllOptions()
        setButtonTitles()

    }
    private func loadIfTypeBool(Type: Bool) {
        if Type == true {
            let thirdButton = allOptionsButtons[2]
            thirdButton.isHidden = true
            let fourthButton = allOptionsButtons[3]
            fourthButton.isHidden = true
        }
    }
    
    private func setButtonTitles() {
        for index in 0..<answerOptions.count {
           allOptionsButtons[index].setTitle(answerOptions[index], for: .normal)
        }
    }
    
    private func disableButtons() {
        for index in 0..<answerOptions.count {
            if allOptionsButtons[index].titleLabel?.text == trivia.getCleanCorrectString() {
                allOptionsButtons[index].setTitleShadowColor(.blue, for: .disabled)
            }
            allOptionsButtons[index].isEnabled = false
        }
        
    }


}

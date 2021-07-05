//
//  EP3DetailViewController.swift
//  UnitTestingLab
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP3DetailViewController: UIViewController {
    
    var trivia: Trivia?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var possibleAnswersTextView: UITextView!
    @IBOutlet weak var userInputTextField:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        userInputTextField.delegate = self
        // Do any additional setup after loading the view.
        updateUI()
        configureUI()
    }
    
    func updateUI(){
        questionLabel.text = trivia?.removePercentEncoding(encodedString: trivia!.question)
        possibleAnswersTextView.text = trivia?.joinAllPossibleAnswersAsString()
    }
    
    func configureUI(){
        possibleAnswersTextView.isEditable = false
    }
    
    func checkGuess(){
        if userInputTextField.text?.lowercased() == trivia?.removePercentEncoding(encodedString: trivia!.correctAnswer).lowercased() {
            view.backgroundColor = .green
        } else {
            view.backgroundColor = .red
        }
    }
    
    func disableUI(){
        userInputTextField.isEnabled = false
    }

}

extension EP3DetailViewController:UITextFieldDelegate{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkGuess()
        textField.resignFirstResponder()
        disableUI()
        return true
    }
}

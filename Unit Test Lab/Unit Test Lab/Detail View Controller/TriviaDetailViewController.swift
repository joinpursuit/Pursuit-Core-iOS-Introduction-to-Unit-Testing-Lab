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

    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = trivia.getCleanQuestionString()
     
    }

}

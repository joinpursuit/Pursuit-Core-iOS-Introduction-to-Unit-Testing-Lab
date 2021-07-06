//
//  DetailJokesViewController.swift
//  UnitTestingLab
//
//  Created by Yuliia Engman on 12/4/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class DetailJokesViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    
    var someJoke: Joke?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let oneJoke = someJoke else {
            fatalError("could not get object from prepare for segue")
        }
        textView.text = oneJoke.punchline
        
    }
}


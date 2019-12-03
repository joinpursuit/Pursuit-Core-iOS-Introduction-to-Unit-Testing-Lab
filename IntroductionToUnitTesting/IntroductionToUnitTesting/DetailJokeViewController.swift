//
//  DetailJokeViewController.swift
//  IntroductionToUnitTesting
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class DetailJokeViewController: UIViewController {

    @IBOutlet weak var punchLineLabel: UILabel!
    
    var currentJoke: Joke?
    
    override func viewDidLoad() {
        setUp()
        super.viewDidLoad()
    }

    private func setUp(){
        punchLineLabel.text = currentJoke?.punchline
    }
}

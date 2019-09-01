//
//  JokesDetailViewController.swift
//  Unit Test Lab
//
//  Created by Michelle Cueva on 9/1/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class JokesDetailViewController: UIViewController {
    
    var jokes: Jokes!

    @IBOutlet weak var punchlineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        punchlineLabel.text = jokes.punchline
    }

}

//
//  PunchLineViewController.swift
//  UnitTestLabProj
//
//  Created by Kevin Natera on 8/29/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

class PunchLineViewController : UIViewController {
    
    var joke: Jokes!
    
    @IBOutlet weak var punchLineLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        punchLineLabel.text = joke.punchline
    }
}

//
//  SWDetailViewController.swift
//  UnitTestLabProj
//
//  Created by Kevin Natera on 8/29/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

class SWDetailViewController : UIViewController {
    
    var movie: StarWars!
    
    @IBOutlet weak var textFieldOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldOutlet.text = movie.opening_crawl
    }
}

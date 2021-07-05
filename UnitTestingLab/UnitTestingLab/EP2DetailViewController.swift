//
//  EP2DetailViewController.swift
//  UnitTestingLab
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP2DetailViewController: UIViewController {
    
    @IBOutlet weak var openingCrawlLabel:UILabel!
    
    var episode: Episode?

    override func viewDidLoad() {
        updateUI()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        openingCrawlLabel.text = episode?.openingCrawl
    }

}

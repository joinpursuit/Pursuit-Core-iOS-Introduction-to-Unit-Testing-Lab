//
//  DetailStarWarsViewController.swift
//  UnitTestingLab
//
//  Created by Yuliia Engman on 12/4/19.
//  Copyright © 2019 Yuliia Engman. All rights reserved.
//

import UIKit

class DetailStarWarsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var someEpisode: Episode?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let oneEpisode = someEpisode else {
            fatalError("could not get object from prepare for segue")
        }
        textView.text = oneEpisode.crawl
    }
}

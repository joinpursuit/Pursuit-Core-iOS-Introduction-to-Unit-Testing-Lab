//
//  DetailedStarWarsViewController.swift
//  IntroductionToUnitTesting
//
//  Created by Cameron Rivera on 12/2/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class DetailedStarWarsViewController: UIViewController {

    @IBOutlet weak var crawlLabel: UILabel!
    
    var currentStarWarsMovie: StarWarsMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    private func setUp(){
        crawlLabel.text = currentStarWarsMovie?.openingCrawl
    }
}

//
//  StarWarsDetailViewController.swift
//  Unit Test Lab
//
//  Created by Michelle Cueva on 9/1/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class StarWarsDetailViewController: UIViewController {
    
    var movie: StarWars!
    
    @IBOutlet weak var crawlTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crawlTextView.isEditable = false
        crawlTextView.text = movie.opening_crawl
    }
    

}

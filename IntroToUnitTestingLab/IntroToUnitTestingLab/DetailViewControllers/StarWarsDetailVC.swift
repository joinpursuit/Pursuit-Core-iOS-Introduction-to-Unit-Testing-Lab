//
//  StarWarsDetailVC.swift
//  IntroToUnitTestingLab
//
//  Created by Sam Roman on 8/29/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class StarWarsDetailVC: UIViewController {

    var selectedMovie: Movies!
    
    @IBOutlet weak var crawlLabel: UILabel!
    
    
    override func viewDidLoad() {
        crawlLabel.text = selectedMovie.opening_crawl
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

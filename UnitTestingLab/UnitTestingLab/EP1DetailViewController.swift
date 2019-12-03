//
//  EP1DetailViewController.swift
//  UnitTestingLab
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP1DetailViewController: UIViewController {
    
    @IBOutlet weak var punchLineLabel: UILabel!
    
    var passedJokesObj: JokesDataModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        guard let validJoke = passedJokesObj else {
            fatalError("check prepare(for: segue)")
        }
        
        punchLineLabel.text = validJoke.punchline
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

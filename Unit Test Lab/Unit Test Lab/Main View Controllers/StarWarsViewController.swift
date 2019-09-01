//
//  StarWarsViewController.swift
//  Unit Test Lab
//
//  Created by Michelle Cueva on 9/1/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    var movies = [StarWars]() {
        didSet {
            starWarsTableView.reloadData()
        }
    }

    @IBOutlet weak var starWarsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
}

extension StarWarsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}

extension StarWarsViewController: UITableViewDelegate {
    
}



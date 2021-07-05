//
//  EP3ViewController.swift
//  UnitTestingLab
//
//  Created by Bienbenido Angeles on 12/2/19.
//  Copyright © 2019 Bienbenido Angeles. All rights reserved.
//

import UIKit

class EP3ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    var questions = [Trivia](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let filename = "Trivia"
        let ext = "json"
        let data = Bundle.readjSONData(filename: filename, ext: ext)
        questions = Trivia.getQuestions(from: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ep3DVC = segue.destination as? EP3DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("failed to segue")
        }
        
        let question = questions[indexPath.row]
        ep3DVC.trivia = question
    }

}

extension EP3ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ep3Cell", for: indexPath)
        let question = questions[indexPath.row]
        cell.textLabel?.text = question.removePercentEncoding(encodedString: question.question)
        return cell
    }
}

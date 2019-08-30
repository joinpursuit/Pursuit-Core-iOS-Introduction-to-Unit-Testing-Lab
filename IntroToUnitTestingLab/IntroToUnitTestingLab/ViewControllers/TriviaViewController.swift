//
//  TriviaViewController.swift
//  IntroToUnitTestingLab
//
//  Created by Sam Roman on 8/29/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var triviaTableView: UITableView!
    
    var trivia: Trivia!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trivia.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCell = trivia.results[indexPath.row]
        let cell = triviaTableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        cell.textLabel?.text = currentCell.question.noPercentEncoding()
        cell.detailTextLabel?.text = currentCell.category.noPercentEncoding()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    private func loadData() {
        //pathToJSONFile is just the string for the name of the file
        guard let pathToJSONFile = Bundle.main.path(forResource: "trivia", ofType: "json") else {
            fatalError("Could not find bundle")
        }
        print(pathToJSONFile)
        //url is the reference of the location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let resultsFromJSON = Trivia.getTrivia(from: data)
            trivia = resultsFromJSON
            
        } catch {
            fatalError("Could not decode")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else { fatalError("No identifier in segue")
        }
        guard let DetailVC = segue.destination as? TriviaDetailVC
            else { fatalError("Unexpected segue")}
        guard let selectedIndexPath = triviaTableView.indexPathForSelectedRow
            else { fatalError("No row selected") }
        DetailVC.answers = trivia.results[selectedIndexPath.row]
    }
    
    override func viewDidLoad() {
        triviaTableView.delegate = self
        triviaTableView.dataSource = self
        loadData()
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

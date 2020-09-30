//
//  ViewController.swift
//  SimpsonBook
//
//  Created by hks on 30.09.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var simpsons = [Simpson]()
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        //simpson objects
        let homer = Simpson(name: "Homer", job: "Nuclear Safety", image: UIImage(named: "homer")!)
        
        let marge = Simpson(name: "Marge", job: "House Wife", image: UIImage(named: "marge")!)
        
        let bart = Simpson(name: "Bart", job: "Student", image: UIImage(named: "bart")!)
        
        let lisa = Simpson(name: "Lisa", job: "Student", image: UIImage(named: "lisa")!)
        
        let maggie = Simpson(name: "Maggie", job: "Baby", image: UIImage(named: "maggle")!)
        
        simpsons.append(homer)
        simpsons.append(marge)
        simpsons.append(bart)
        simpsons.append(lisa)
        simpsons.append(maggie)
    }

    //number of row count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsons.count
    }
    
    //create row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsons[indexPath.row].name
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedSimpson = chosenSimpson
        }
        
    }
    
}


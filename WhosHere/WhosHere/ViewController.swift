//
//  ViewController.swift
//  WhosHere
//
//  Created by argenis delarosa on 3/21/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var names = ["Dakota", "Argenis", "Barbie", "Erik", "David", "Carls", "Chris", "Arber", "Zev", "Liam", "Noah", "William", "James", "Logan", "Benjamin", "Dakota", "Argenis", "Barbie", "Erik", "David", "Carls", "Chris", "Arber", "Zev", "Liam", "Noah", "William", "James", "Logan", "Benjamin"]
    
    var whosHere = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        whosHere = Array(repeating: false, count: names.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        if whosHere[indexPath.row] == true {
            cell.backgroundColor = UIColor.green
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        cell?.backgroundColor = UIColor.green
        whosHere[indexPath.row] = true
    }
}


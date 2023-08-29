//
//  ViewController.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 8/28/23.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.rowHeight = 55
    }
    
    @IBOutlet weak var addButton = UIBarButtonItem()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "daysCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "Leg day"
        cell.contentConfiguration = content
        return cell
    }
    
    private func showInputAlert() {
        let alertController = UIAlertController(title: "Workout Day", message: "Add your day title", preferredStyle: .alert)
        alertController.addTextField()
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let enteredText = alertController.textFields?.first {
                let newItem = Day()
                newItem.day = enteredText.text!
            }
        }
    }
}


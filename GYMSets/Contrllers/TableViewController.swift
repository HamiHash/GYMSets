//
//  ViewController.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 8/28/23.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    let realm = try! Realm()
    var workoutDays: Results<Day>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        tableView.rowHeight = 55
    }
    
    //MARK: - TableView DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutDays?.count ?? 1
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "daysCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = workoutDays?[indexPath.item].day ?? "Add a Day"
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            delete(workoutDays![indexPath.item])
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToSet", sender: self)
    }
    
    //MARK: - Add button
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        showInputAlert()
    }
    
    private func showInputAlert() {
        let alertController = UIAlertController(title: "Workout Day", message: "Add your day title", preferredStyle: .alert)
        alertController.addTextField()
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let enteredText = alertController.textFields?.first {
                let newItem = Day()
                newItem.day = enteredText.text!
                self.add(newItem) /// Realm
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}


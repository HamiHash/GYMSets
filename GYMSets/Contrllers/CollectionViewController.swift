//
//  CollectionViewController.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 8/30/23.
//

import UIKit
import RealmSwift

class CollectionViewController: UICollectionViewController {

    let realm = RealmActions() /// initializing our custom realm class
    var workoutSets: Results<Set>?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutSets = realm.loadSets()
        
        collectionView.register(SetsCell.self, forCellWithReuseIdentifier: SetsCell.reuseIdentifier)
        
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        collectionView.collectionViewLayout = layout
        
    }
    
    //MARK: - CollectionView DataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutSets?.count ?? 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetsCell.reuseIdentifier, for: indexPath) as? SetsCell else {
            fatalError("failed to reuse cell")
        }
        cell.configure(title: workoutSets?[indexPath.item].workout ?? "Add a Set")
        return cell
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
                let newItem = Set()
                newItem.workout = enteredText.text!
                newItem.sets = "1"
                newItem.reps = "2"
                self.realm.add(newItem)
                self.collectionView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

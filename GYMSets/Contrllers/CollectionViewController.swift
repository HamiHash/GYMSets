//
//  CollectionViewController.swift
//  GYMSets
//
//  Created by Hamed Hashemi on 8/30/23.
//

import UIKit
import RealmSwift

class CollectionViewController: UICollectionViewController {

    let realm = RealmActions()
    var relatedDay: Day?
    var workoutSets: Results<Set>?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        workoutSets = relatedDay?.sets as? Results<Set> /// Loading Data
        
        collectionView.register(SetsCell.self, forCellWithReuseIdentifier: SetsCell.reuseIdentifier)
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        collectionView.collectionViewLayout = layout
        
    }
        
    //MARK: - CollectionView DataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return relatedDay?.sets.count ?? 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetsCell.reuseIdentifier, for: indexPath) as? SetsCell else {
            fatalError("failed to reuse cell")
        }
        cell.configure(title: relatedDay?.sets[indexPath.item].workout ?? "Add a Set")
        return cell
    }
    
    //MARK: - Add button

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        showInputAlert()
    }
    
    private func showInputAlert() {
        let alertController = UIAlertController(title: "Workout Day", message: "Add your day title", preferredStyle: .alert)
        alertController.addTextField()
        let addAction = UIAlertAction(title: "Add", style: .default) { [self] _ in
            if let enteredText = alertController.textFields?.first {
                print("enteredText: \(enteredText)")
                let newItem = Set()
                newItem.workout = enteredText.text!
                /// This seems complicated but its not -> 
                relatedDay = realm.addSet(newItem, relatedDay!)
                collectionView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

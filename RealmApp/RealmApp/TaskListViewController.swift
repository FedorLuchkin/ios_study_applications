//
//  TaskListViewController.swift
//  RealmApp
//
//  Created by Fixed on 20.06.2023.
//

import UIKit

class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath)


        return cell
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        showAlert()
    }
    

    @IBAction func sortingList(_ sender: UISegmentedControl) {
    }
}

extension TaskListViewController {
    private func showAlert() {
        let alert = AlertController(title: "New List", message: "Please insert new value", preferredStyle: .alert)
        alert.action { newValue in
            
        }
        
        present(alert, animated: true)
    }
    
}
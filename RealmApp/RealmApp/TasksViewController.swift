//
//  TasksViewController.swift
//  RealmApp
//
//  Created by Fixed on 20.06.2023.
//

import UIKit

class TasksViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath)


        return cell
    }

    private func addButtonPressed(_ sender: UIBarButtonItem) {
        showAlert()
    }

}

extension TasksViewController {
    private func showAlert() {
        let alert = AlertController(title: "New Task", message: "What do you want to do?", preferredStyle: .alert)
        alert.action { newValue, note in
            
        }
        
        present(alert, animated: true)
    }
}

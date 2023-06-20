//
//  TaskListViewController.swift
//  RealmApp
//
//  Created by Fixed on 20.06.2023.
//

import RealmSwift

class TaskListViewController: UITableViewController {
    
    private var taskLists: Results<TaskList>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // createTestData() // создание тестовых данных
        taskLists = StorageManager.shared.realm.objects(TaskList.self)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskLists.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath)
        let taskList = taskLists[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = taskList.name
        content.secondaryText = "\(taskList.tasks.count)"
        cell.contentConfiguration = content
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let tasksVC = segue.destination as? TasksViewController else { return }
        let taskList = taskLists[indexPath.row]
        tasksVC.taskList = taskList
        tasksVC.title = taskList.name
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
    @IBAction func sortingList(_ sender: UISegmentedControl) {
    }
    
    private func createTestData() {
        let shoppingList = TaskList()
        shoppingList.name = "Shopping List"
        
        let milk = Task()
        milk.name = "Milk"
        milk.note = "2L"
        
        let bread = Task(value: ["Bread", "", Date(), true])
        let apples = Task(value: ["name": "Apples", "note": "2Kg"])
        
        shoppingList.tasks.append(milk)
        shoppingList.tasks.insert(contentsOf: [bread, apples], at: shoppingList.tasks.count)
        
        let moviesList = TaskList(value: ["Movie List",
                                          Date(),
                                          [
                                            ["Best Film Ever"],
                                            ["The Best of the Best", "Must have", Date(), true]
                                          ]
        ])
        
        // на время транзакции поток блокируется, поэтому делаем это ассинхронно в другом потоке
        DispatchQueue.main.async {
            StorageManager.shared.save(taskLists: [shoppingList, moviesList])
        }
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

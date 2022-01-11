//
//  ViewController.swift
//  Todo
//
//  Created by Justin Lowry on 12/15/21.
//

import UIKit


struct Todo {
    var name: String
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    var todos = [
        Todo(name: "Do the dishes"),
        Todo(name: "Walk the dog"),
        Todo(name: "Play games with friends")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Actions
    @IBAction func didPressAddButton(_ sender: Any) {
        let indexPath = IndexPath(row: todos.count, section: 0)
        todos.append(Todo(name: "Default todo"))
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func didPressEditButton(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        if tableView.isEditing {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didPressEditButton(_:)))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(didPressEditButton(_:)))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        cell.textLabel?.text = todos[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, dis indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todoBeingMoved = todos[sourceIndexPath.row]
        todos.remove(at: sourceIndexPath.row)
        todos.insert(todoBeingMoved, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .insert:
            break
        case .none:
            break
        }
    }
}


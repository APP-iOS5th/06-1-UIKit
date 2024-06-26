//
//  ViewController.swift
//  TodoList
//
//  Created by Jungman Bae on 5/24/24.
//

import UIKit

extension Date {
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
}

enum TodoError: Error {
    case notFound
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "todoCell")
        
        return tableView
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Add Task", for: .normal)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.imagePadding = 10.0
        button.configuration = config
        
        button.addAction(UIAction { [weak self] _ in
            let addTaskViewController =  AddTaskViewController()
            addTaskViewController.completionHandler = { [weak self] in
                self?.updateLayout()
                self?.tableView.reloadData()
            }
            let navigationController = UINavigationController(rootViewController: addTaskViewController)
            self?.present(navigationController, animated: true)
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var emptyAddButtonCenterConstraints: [NSLayoutConstraint] = {
        return [
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
    }()
    
    private lazy var addButtonBottomConstraints: [NSLayoutConstraint] = {
        let safeArea = view.safeAreaLayoutGuide
        return [
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16)
        ]
    }()
    
    private lazy var tableViewConstraints: [NSLayoutConstraint] = {
        let safeArea = view.safeAreaLayoutGuide
        return [
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -20)
        ]
    }()
    
    var todayTodos: [Todo] {
        return TodoStore.shared.getList().filter { $0.date?.isToday ?? false }
    }
    
    var tomorrowTodos: [Todo] {
        return TodoStore.shared.getList().filter { $0.date?.isTomorrow ?? false }
    }
    
    var noDateTodos: [Todo] {
        return TodoStore.shared.getList().filter { $0.date == nil }
    }
    
    var otherTodos: [Todo] {
        return TodoStore.shared.getList().filter {
            !($0.date?.isToday ?? false) && !($0.date?.isTomorrow ?? false) && $0.date != nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TODO"
        
        view.addSubview(tableView)
        view.addSubview(addButton)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        updateLayout()
    }
    
    // MARK: - Methods
    func updateLayout() {
        if TodoStore.shared.listCount > 0 {
            NSLayoutConstraint.deactivate(emptyAddButtonCenterConstraints)
            NSLayoutConstraint.activate(tableViewConstraints + addButtonBottomConstraints)
        } else {
            NSLayoutConstraint.deactivate(tableViewConstraints + addButtonBottomConstraints)
            NSLayoutConstraint.activate(emptyAddButtonCenterConstraints)
        }
    }
    
    func getTodo(for indexPath: IndexPath) throws -> Todo {
        switch indexPath.section {
        case 0: todayTodos[indexPath.row]
        case 1: tomorrowTodos[indexPath.row]
        case 2: noDateTodos[indexPath.row]
        case 3: otherTodos[indexPath.row]
        default: throw TodoError.notFound
        }
    }
    
    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return todayTodos.count
        case 1:
            return tomorrowTodos.count
        case 2:
            return noDateTodos.count
        case 3:
            return otherTodos.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
                
        do {
            let todo = try getTodo(for: indexPath)
            var config = cell.defaultContentConfiguration()
            config.text = todo.task
            
            if let dueDate = todo.date {
                let formatter = DateFormatter()
                formatter.dateStyle = .short
                formatter.timeStyle = .none
                config.secondaryText = formatter.string(from: dueDate)
                
                if dueDate < Date() {
                    config.secondaryTextProperties.color = .red
                } else {
                    config.secondaryTextProperties.color = .gray
                }
            }
            
            config.image = UIImage(systemName: todo.isDone ? "checkmark.square.fill" : "checkmark.square")
            
            cell.contentConfiguration = config
            cell.selectionStyle = .none
        } catch TodoError.notFound {
            print("Not Found")
        } catch {
            print("Other")
        }
        
        return cell

    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let todo: Todo = try? getTodo(for: indexPath) {
            TodoStore.shared.updateTodo(todo: Todo(id: todo.id,
                                                   task: todo.task,
                                                   date: todo.date,
                                                   isDone: !todo.isDone))
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: "오늘"
        case 1: "내일"
        case 2: "미지정"
        case 3: "그 외"
        default: nil
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete,
           let todo: Todo = try? getTodo(for: indexPath) {
            TodoStore.shared.removeTodo(todo: todo)
            tableView.reloadData()
            updateLayout()
        }
    }
    
}


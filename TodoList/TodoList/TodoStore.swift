//
//  TodoStore.swift
//  TodoList
//
//  Created by Jungman Bae on 5/24/24.
//

import Foundation

struct Todo: Identifiable, Codable {
    let id: UUID
    let task: String
    let date: Date?
    let isDone: Bool
}

class TodoStore {
    static let shared = TodoStore()
    private var todoList: [Todo]
    
    var listCount: Int {
        return todoList.count
    }
    
    private init() {
        todoList = [
            Todo(id: UUID(), task: "오늘 할 일", date: Date(), isDone: true),
            Todo(id: UUID(), task: "내일 할 일", date: Calendar.current.date(byAdding: .day, value: 1, to: Date()), isDone: false),
            Todo(id: UUID(), task: "미지정 할 일", date: nil, isDone: false),
            Todo(id: UUID(), task: "그 외", date: Calendar.current.date(byAdding: .month, value: 1, to: Date()), isDone: false),
        ]
    }
        
    func addTodo(todo: Todo) {
        todoList.append(todo)
    }
    
    func updateTodo(todo: Todo) {
        removeTodo(todo: todo)
        addTodo(todo: todo)
    }
    
    func removeTodo(todo: Todo) {
        todoList = todoList.filter { $0.id != todo.id }
    }
    
    func getTodo(at: IndexPath) -> Todo {
        return todoList[at.row]
    }
    
    func getList() -> [Todo] {
        let list = todoList
        return list
    }
}

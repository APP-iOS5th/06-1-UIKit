//
//  AddTaskViewController.swift
//  TodoList
//
//  Created by Jungman Bae on 5/24/24.
//

import UIKit

class AddTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Add Task"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                                target: self,
                                                                action: #selector(cancleAddTask))
    }
 
    @objc func cancleAddTask(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

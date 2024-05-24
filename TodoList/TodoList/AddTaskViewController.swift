//
//  AddTaskViewController.swift
//  TodoList
//
//  Created by Jungman Bae on 5/24/24.
//

import UIKit

class AddTaskViewController: UIViewController {
    private var taskTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        textField.placeholder = "할 일을 입력하세요."
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var dueDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private lazy var dueDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIButton.Configuration.bordered()
        
        let todayButton = UIButton(type: .custom)
        todayButton.setTitle("오늘", for: .normal)
        todayButton.configuration = config
        
        let tomorrowButton = UIButton(type: .custom)
        tomorrowButton.setTitle("내일", for: .normal)
        tomorrowButton.configuration = config
        
        let noDueButton = UIButton(type: .custom)
        noDueButton.setTitle("미지정", for: .normal)
        noDueButton.configuration = config

        stackView.addArrangedSubview(todayButton)
        stackView.addArrangedSubview(tomorrowButton)
        stackView.addArrangedSubview(noDueButton)
        stackView.addArrangedSubview(dueDatePicker)
        
        return stackView
    }()
    
    private var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.filled()
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            return outgoing
        }

        button.configuration = config
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Add Task"
        
        view.addSubview(taskTextField)
        view.addSubview(dueDateStackView)
        view.addSubview(submitButton)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                                target: self,
                                                                action: #selector(cancleAddTask))
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            taskTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            taskTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            taskTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            
            dueDateStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            dueDateStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            dueDateStackView.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            
            submitButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            submitButton.topAnchor.constraint(equalTo: dueDateStackView.bottomAnchor, constant: 20)
            
        ])
    }
 
    @objc func cancleAddTask(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

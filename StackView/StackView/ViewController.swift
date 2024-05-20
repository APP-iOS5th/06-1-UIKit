//
//  ViewController.swift
//  StackView
//
//  Created by Jungman Bae on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    let toggleSwitch = UISwitch()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Switch is OFF"
        label.textAlignment = .center
        
        toggleSwitch.addAction(UIAction { [weak self] _ in
            print("valueChanged")
            if let isOn = self?.toggleSwitch.isOn, isOn {
                self?.label.text = "Switch is ON"
            } else {
                self?.label.text = "Switch is OFF"
            }
            
        }, for: .valueChanged)
        
        let stackView = UIStackView(arrangedSubviews: [label, toggleSwitch])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}


//
//  ViewController.swift
//  AutoLayout
//
//  Created by Jungman Bae on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "Hello, Auto Layout"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
            
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = false
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
    }


}


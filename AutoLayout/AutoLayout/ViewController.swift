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
        
        let containerView = UIView()
        containerView.backgroundColor = .lightGray
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 200),
            containerView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let subview1 =  UIView()
        subview1.backgroundColor = .red
        subview1.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subview1)
        
        let subview2 = UIView()
        subview2.backgroundColor = .blue
        subview2.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(subview2)
        
        NSLayoutConstraint.activate([
            subview1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            subview1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            subview1.widthAnchor.constraint(equalToConstant: 50),
            subview1.heightAnchor.constraint(equalToConstant: 50),

            subview2.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            subview2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            subview2.widthAnchor.constraint(equalToConstant: 50),
            subview2.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}


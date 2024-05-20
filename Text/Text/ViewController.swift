//
//  ViewController.swift
//  Text
//
//  Created by Jungman Bae on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "Stylized Text"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .yellow
        label.backgroundColor = .red
        label.textAlignment = .center
        
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }


}


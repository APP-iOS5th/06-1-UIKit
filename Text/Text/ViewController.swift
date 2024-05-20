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
        
        let attributedString = NSMutableAttributedString(string: "Hello, World")
        attributedString.addAttribute(.font, value: UIFont.italicSystemFont(ofSize: 20), range: NSRange(location: 0, length: 5))
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 7, length: 5))
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: 12))
        
        let label = UILabel()
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
    }


}


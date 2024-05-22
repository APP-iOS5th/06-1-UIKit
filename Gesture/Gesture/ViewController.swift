//
//  ViewController.swift
//  Gesture
//
//  Created by Jungman Bae on 5/22/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rectangle = UIView()
        rectangle.backgroundColor = .yellow
        rectangle.frame = CGRect(x: 100, y: 100, width: 175, height: 125)
        rectangle.isUserInteractionEnabled = true
        
        view.addSubview(rectangle)
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleGesture))
        gesture.minimumPressDuration = 2.0
        rectangle.addGestureRecognizer(gesture)
    }

    @objc func handleGesture(_ sender: UILongPressGestureRecognizer) {
        print("\(sender.state)")
        if let view = sender.view, sender.state == .began {
            view.backgroundColor = (view.backgroundColor == .yellow) ? .red : .yellow
        }
    }

}


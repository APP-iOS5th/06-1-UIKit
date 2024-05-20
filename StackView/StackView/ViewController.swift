//
//  ViewController.swift
//  StackView
//
//  Created by Jungman Bae on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self 를 쓰는 이유: 지역변수와 멤버변수의 구분을 위해. 같은 이름의 지역변수가 없다면 생략가능
        let view = UIView()
        self.view.addSubview(view)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        let topLabel = UILabel()
        topLabel.text = "위"
        topLabel.textAlignment = .center
        topLabel.backgroundColor = .lightGray
        
        let leftLabel = UILabel()
        leftLabel.text = "왼쪽"
        leftLabel.textAlignment = .center
        leftLabel.backgroundColor = .lightGray

        let rightLabel = UILabel()
        rightLabel.text = "오른쪽"
        rightLabel.textAlignment = .center
        rightLabel.backgroundColor = .lightGray
        
        let hStackView = UIStackView(arrangedSubviews: [leftLabel, rightLabel])
        hStackView.axis = .horizontal
        hStackView.spacing = 10
        
        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(hStackView)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])

    }


}


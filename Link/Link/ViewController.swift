//
//  ViewController.swift
//  Link
//
//  Created by Jungman Bae on 5/21/24.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isHidden = true
        return webView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction { [weak self] _ in
            self?.webView.isHidden = true
        }, for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let linkButton = UIButton(type: .system)
        var conf = UIButton.Configuration.filled()
        conf.title = "Apple"
        linkButton.configuration = conf
        linkButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        linkButton.addAction(UIAction { [weak self] _ in
            if let url = URL(string:"https://www.apple.com") {
//                UIApplication.shared.open(url)
//                let safariViewController = SFSafariViewController(url: url)
//                // 다양한 형태의 모달 뷰로 띄울 수 있다.
//                safariViewController.modalPresentationStyle = .pageSheet
//                self?.present(safariViewController, animated: true)
                self?.openInWebView(url: url)
            }
        }, for: .touchUpInside)
        
        view.addSubview(linkButton)
        webView.addSubview(closeButton)
        view.addSubview(webView)

        NSLayoutConstraint.activate([
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            closeButton.topAnchor.constraint(equalTo: webView.topAnchor, constant: -30),
            closeButton.trailingAnchor.constraint(equalTo: webView.trailingAnchor, constant: -10)
        ])
    }

    func openInWebView(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
        webView.isHidden = false
    }
}


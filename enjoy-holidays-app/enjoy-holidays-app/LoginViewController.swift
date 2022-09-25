//
//  ViewController.swift
//  enjoy-holidays-app
//
//  Created by Ricardo Lopez Magana on 20/09/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
         style()
         layout()
    }
}

extension LoginViewController {
    
    private func style() {
        loginView.backgroundColor = .orange
        loginView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
    }
}


//
//  ViewController.swift
//  enjoy-holidays-app
//
//  Created by Ricardo Lopez Magana on 20/09/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInbutton = UIButton(type: .system)
    let messageError = UILabel()
    let primaryTitle = UILabel()
    let subTitle = UILabel()
    
    
    var username: String? {
        return loginView.fullNameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         style()
         layout()
    }
}

extension LoginViewController {
    
    private func style() {
        loginView.backgroundColor = .systemGroupedBackground
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInbutton.translatesAutoresizingMaskIntoConstraints = false
        signInbutton.configuration = .filled()
        signInbutton.configuration?.imagePadding = 8
        signInbutton.setTitle("Sign In", for: [])
        signInbutton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        messageError.translatesAutoresizingMaskIntoConstraints = false
        messageError.textColor = .red
        messageError.textAlignment = .center
        messageError.adjustsFontSizeToFitWidth = true
        messageError.isHidden = true
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.textColor = .black
        subTitle.text = "Pasa las mejores vacasiones con con nosotros"
        subTitle.numberOfLines = 0
        subTitle.textAlignment = .center
        subTitle.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        
        primaryTitle.translatesAutoresizingMaskIntoConstraints = false
        primaryTitle.textColor = .black
        primaryTitle.text = "HOTELES MX"
        primaryTitle.textColor = .blue
        primaryTitle.numberOfLines = 0
        primaryTitle.textAlignment = .center
        primaryTitle.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
        
    }
    
    private func layout() {
        view.addSubview(primaryTitle)
        view.addSubview(subTitle)
        view.addSubview(loginView)
        view.addSubview(signInbutton)
        view.addSubview(messageError)
        
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalToSystemSpacingBelow: primaryTitle.bottomAnchor, multiplier: 3),
            primaryTitle.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            primaryTitle.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitle.bottomAnchor, multiplier: 3),
            subTitle.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subTitle.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // MARK: subView Layout
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // MARK: Button Layout
        NSLayoutConstraint.activate([
            signInbutton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInbutton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInbutton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        // MARK: TextError Layout
        NSLayoutConstraint.activate([
            messageError.topAnchor.constraint(equalToSystemSpacingBelow: signInbutton.bottomAnchor, multiplier: 2),
            messageError.leadingAnchor.constraint(equalTo: signInbutton.leadingAnchor),
            messageError.trailingAnchor.constraint(equalTo: signInbutton.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    
    @objc func signInTapped(sender: UIButton) {
        messageError.isHidden = false
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Nombre / password no deberia de ser nulo")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMesaage: "Nombre / password no pueden estar en blanco" )
            return
        }
        
        if username == "Ricardo" && password == "1234" {
            signInbutton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMesaage: "El nombre es incorrecto / contraseña")
        }
    }
    
    private func configureView(withMesaage message: String) {
        messageError.isHidden = false
        messageError.text = message
    }
}


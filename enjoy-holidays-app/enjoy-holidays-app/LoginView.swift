//
//  LoginView.swift
//  enjoy-holidays-app
//
//  Created by Ricardo Lopez Magana on 24/09/22.
//

import UIKit

class LoginView: UIView {
    
    let lineView = UIView()
    let stackView = UIStackView()
    let fullNameTextField = UITextField()
    let passwordTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    
    func style() {
        addSubview(stackView)
        stackView.addArrangedSubview(fullNameTextField)
        stackView.addArrangedSubview(lineView)
        stackView.addArrangedSubview(passwordTextField)
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        fullNameTextField.translatesAutoresizingMaskIntoConstraints = false
        fullNameTextField.placeholder = "Nombre"
        fullNameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Contraseña"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .gray
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    func layout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor , multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
     
    }
}
// MARK: UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fullNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}

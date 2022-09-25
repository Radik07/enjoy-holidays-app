//
//  LoginView.swift
//  enjoy-holidays-app
//
//  Created by Ricardo Lopez Magana on 24/09/22.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension LoginView {
    
    func style() {
        
    }
    func layout() {
        
    }
}

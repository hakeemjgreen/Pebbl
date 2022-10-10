//
//  LoginView.swift
//  Pebbl
//
//  Created by Hakeem Green on 10/9/22.
//

import Foundation
import UIKit

class LoginView: UIView{
    
    let usernameField = UITextField()
    let passwordField = UITextField()
    let stackView = UIStackView()
    let feedViewController = FeedViewController()
    
    let signInButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    
    
}
extension LoginView{
    func style(){
        addSubview(stackView)

        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.placeholder = "Username or Email"
        usernameField.delegate = self
 
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Log in", for: .normal)
        signInButton.configuration = .filled()
//        signInButton.addTarget(self, action: #selector(LoginViewController.signInClick), for: .touchUpInside)
//        signInButton.isEnabled = false
        
        stackView.addArrangedSubview(usernameField)
        stackView.addArrangedSubview(passwordField)
        addSubview(signInButton)
        
//        backgroundColor = .red
//        stackView.backgroundColor = .green
    }
    func layout(){
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 8 ),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter:leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
//            bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 1),
            
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            signInButton.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}
extension LoginView: UITextFieldDelegate{
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Typed")
        if usernameField.text != ""{
            return true
        } else {
            return false
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameField.endEditing(true)
        passwordField.endEditing(true)
        return true
    }
}

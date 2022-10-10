//
//  LoginView.swift
//  Pebbl
//
//  Created by Hakeem Green on 10/9/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController{
    let appearance = UINavigationBarAppearance()
    let phoneNumberButton = UIButton()
    let emailButton = UIButton()
    let loginView = LoginView()
    let phoneNumberView = PhoneNumberView()
    let feedViewController = FeedViewController()
    var window: UIWindow?
    
    
//    var topBarHeight:CGFloat
    
    let activeView = "phoneNumberView"

    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
    }
    
    @objc func phoneNumberButtonClick(){
        loginView.isHidden = true
        phoneNumberView.isHidden = false
    }
    
    @objc func emailButtonClick(){
        phoneNumberView.isHidden = true
        loginView.isHidden = false
//        }
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: emailButton.bottomAnchor, multiplier: 2),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
    }
    @objc func signInClick(){
        print("CLICKED")
        
//        stackView.removeArrangedSubview()
//        emailButton.removeFromSuperview()
//        phoneNumberButton.removeFromSuperview()
//        phoneNumberView.removeFromSuperview()
//        loginView.removeFromSuperview()
        
//        print(self.parent)
//        print(view)
//        self.present(feedViewController, animated:false, completion:nil)
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = feedViewController
        UIApplication.shared.keyWindow?.rootViewController = feedViewController
    }
}

extension LoginViewController{
    
    func style(){        
//        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let topBarHeight = self.navigationController?.navigationBar.frame.size.height ?? 0

        self.title = "Login"
        appearance.titleTextAttributes = [.foregroundColor: UIColor.red]

        phoneNumberButton.frame = CGRect(x: 0, y: 0, width: view.frame.width/2, height: 40)
        phoneNumberButton.setTitle("Phone", for: .normal)
        phoneNumberButton.frame.origin.x = 0
//        phoneNumberButton.frame.origin.y = phoneNumberButton.frame.height
        phoneNumberButton.frame.origin.y = topBarHeight+phoneNumberButton.frame.height
//        phoneNumberButton.backgroundColor = .red
        phoneNumberButton.setTitleColor(.black, for: .normal)
        phoneNumberButton.addTarget(self, action: #selector(phoneNumberButtonClick), for: .touchUpInside)

        emailButton.frame = CGRect(x: 0, y: 0, width: view.frame.width/2, height: 40)
        emailButton.setTitle("Email/Username", for: .normal)
        emailButton.frame.origin.x = emailButton.frame.width
        emailButton.frame.origin.y = topBarHeight + emailButton.frame.height
//        emailButton.backgroundColor = .green
        emailButton.setTitleColor(.black, for: .normal)
        emailButton.addTarget(self, action: #selector(emailButtonClick), for: .touchUpInside)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberView.translatesAutoresizingMaskIntoConstraints = false
        
        loginView.signInButton.addTarget(self, action: #selector(signInClick), for: .touchUpInside)
    }
    
    func layout(){
        view.addSubview(emailButton)
        view.addSubview(phoneNumberButton)
        view.addSubview(phoneNumberView)
        view.addSubview(loginView)
                
        if activeView == "phoneNumberView"{
            NSLayoutConstraint.activate([
                phoneNumberView.topAnchor.constraint(equalToSystemSpacingBelow: emailButton.bottomAnchor, multiplier: 6),
                phoneNumberView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: phoneNumberView.trailingAnchor, multiplier: 1),
            ])
            loginView.isHidden = true
        }
        else{
            print("YESSS")
            NSLayoutConstraint.activate([
                loginView.topAnchor.constraint(equalToSystemSpacingBelow: emailButton.bottomAnchor, multiplier: 6),
                loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            ])
        }
        
        
    }
}

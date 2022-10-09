//
//  onboardingViewController.swift
//  Pebbl
//
//  Created by Hakeem Green on 10/8/22.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    var newVC = UIView()
    var titleText: String
    var descriptionText: String
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
        
    let topImage = UIImageView()
    
    init(titleText: String, descriptionText: String) {
        self.titleText = titleText
        self.descriptionText = descriptionText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        style()
        
        
    }
    
    private func style(){
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            topImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 120),
            view.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
//            view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 100)
//            actionView.heightAnchor.constraint(equalToConstant: 100)
//            newVC.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    private func layout(){

        topImage.image = UIImage(named: "community")
        topImage.contentMode = .scaleAspectFit
        topImage.backgroundColor = .purple
        topImage.frame.origin.x = 0
        topImage.frame.origin.y = 0
        
        
        view.addSubview(topImage)
        view.addSubview(newVC)
//        view.backgroundColor = .green
        
        titleLabel.text = titleText
        titleLabel.font = UIFont(name: "NotoSansOriya-Bold", size: 34)!
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
 
        descriptionLabel.text = descriptionText
        
        //Set position to bottom of view
        descriptionLabel.frame.origin.x = 0
        descriptionLabel.frame.origin.y = self.view.frame.height-descriptionLabel.frame.height
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
//        descriptionLabel.textColor = UIColor(hex: "#ffffff")
        descriptionLabel.setLineHeight(lineHeight: 10)
        view.addSubview(descriptionLabel)
        
//        actionView.translatesAutoresizingMaskIntoConstraints = false
//        actionView.backgroundColor = .purple
    }
}

//
//  PhoneNumberView.swift
//  Pebbl
//
//  Created by Hakeem Green on 10/10/22.
//

import Foundation
import UIKit

class PhoneNumberView : UIView{
    let stackView = UIStackView()
    let phoneNumberField = UITextField()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("LOADEDDDD")
        backgroundColor = .red
        addSubview(stackView)
        stackView.addArrangedSubview(phoneNumberField)
        
        translatesAutoresizingMaskIntoConstraints = false
        phoneNumberField.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberField.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: trailingAnchor),
            topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

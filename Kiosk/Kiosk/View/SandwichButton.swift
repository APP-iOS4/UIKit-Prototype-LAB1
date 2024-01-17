//
//  SandwichButton.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import UIKit

class SandwichButton: UICollectionViewCell {
    
    var sandwichTitle: String = "" {
        didSet {
            sandwichLabel.text = sandwichTitle
        }
    }
    
    var sandwichEngTitle: String = "" {
        didSet {
            sandwichEngLabel.text = sandwichEngTitle
        }
    }
    
    var sandwichCalTitle: String = "" {
        didSet {
            sandwichCalLabel.text = sandwichCalTitle
        }
    }
    
    let containerView: UIView = UIView()
    let sandwichImageView = UIImageView()
    let sandwichLabel = UILabel()
    let sandwichEngLabel = UILabel()
    let sandwichCalLabel = UILabel()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerView.backgroundColor = .white
        sandwichImageView.contentMode = .scaleAspectFit
        sandwichImageView.image = UIImage(named: "card")
        
        sandwichLabel.textColor = .black
        sandwichLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        sandwichLabel.textAlignment = .center
        
        sandwichEngLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        sandwichEngLabel.textColor = .init(named: "paymentEngLabel")
        sandwichEngLabel.textAlignment = .center
        
        sandwichCalLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        sandwichCalLabel.textColor = .init(named: "mainOrange")
        sandwichCalLabel.textAlignment = .center
        
        customAddSubView(containerView)
        containerView.customAddSubView(sandwichImageView)
        containerView.customAddSubView(sandwichLabel)
        containerView.customAddSubView(sandwichEngLabel)
        containerView.customAddSubView(sandwichCalLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: sandwichCalLabel.bottomAnchor, constant: 26),
            
            sandwichImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            sandwichImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 38),
            sandwichImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -38),
            sandwichImageView.heightAnchor.constraint(equalTo: sandwichImageView.widthAnchor),
            
            sandwichLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sandwichLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sandwichLabel.topAnchor.constraint(equalTo: sandwichImageView.bottomAnchor, constant: 10),
            
            sandwichEngLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sandwichEngLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sandwichEngLabel.topAnchor.constraint(equalTo: sandwichLabel.bottomAnchor),
            
            sandwichCalLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sandwichCalLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sandwichCalLabel.topAnchor.constraint(equalTo: sandwichEngLabel.bottomAnchor, constant: 38),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

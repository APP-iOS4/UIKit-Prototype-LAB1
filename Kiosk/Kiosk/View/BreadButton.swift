//
//  BreadButton.swift
//  Kiosk
//
//  Created by 기 표 on 1/17/24.
//

import UIKit

class BreadButton: UICollectionViewCell {
    
    static let breadButtonID: String = "BreadButton"
    
    var breadTitle: String = "" {
        didSet {
            breadLabel.text = breadTitle
        }
    }
    
    var breadEngTitle: String = "" {
        didSet {
            breadEngLabel.text = breadEngTitle
        }
    }
    
    var breadKcalTitle: String = "" {
        didSet {
            breadKcalLabel.text = breadKcalTitle
        }
    }
    
    var isSelect: Bool = false {
           didSet {
               if isSelect == true {
                   containerView.layer.borderColor = UIColor(named: "mainGreen")?.cgColor
               } else {
                   containerView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
               }
           }
       }
    
    let containerView = UIView()
    let breadImageView = UIImageView()
    let breadLabel = UILabel()
    let breadEngLabel = UILabel()
    let breadKcalLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView.backgroundColor = .white
        containerView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        containerView.layer.borderWidth = 4
        containerView.layer.cornerRadius = 15
        
        breadImageView.contentMode = .scaleAspectFit
        breadImageView.image = UIImage(named: "flatbread")
        
        breadLabel.textColor = .black
        breadLabel.font = .systemFont(ofSize: 36, weight: .semibold)
        breadLabel.textAlignment = .center
        
        breadEngLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        breadEngLabel.textColor = .init(named: "paymentEngLabel")
        breadEngLabel.textAlignment = .center
        
        breadKcalLabel.font = .systemFont(ofSize: 18, weight: .bold)
        breadKcalLabel.textColor = .init(named: "mainOrange")
        breadKcalLabel.textAlignment = .center
        
        customAddSubView(containerView)
        containerView.customAddSubView(breadLabel)
        containerView.customAddSubView(breadImageView)
        containerView.customAddSubView(breadLabel)
        containerView.customAddSubView(breadEngLabel)
        containerView.customAddSubView(breadKcalLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: breadEngLabel.bottomAnchor, constant: 80),
            
            breadImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            breadImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 45),
            breadImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -50),
            breadImageView.heightAnchor.constraint(equalTo: breadImageView.widthAnchor),
            
            breadLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            breadLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            breadLabel.topAnchor.constraint(equalTo: breadImageView.bottomAnchor, constant: 5),
            
            breadEngLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            breadEngLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            breadEngLabel.topAnchor.constraint(equalTo: breadLabel.bottomAnchor, constant: 3),
            
            breadKcalLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            breadKcalLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            breadKcalLabel.topAnchor.constraint(equalTo: breadEngLabel.bottomAnchor, constant: 20),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

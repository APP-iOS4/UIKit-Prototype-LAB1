//
//  Vegitable.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class VegitableCell: UICollectionViewCell {
    
    static let identifier: String = "vegitableCell"

    var vegitableTitle: String = "" {
        didSet {
            vegitableLabel.text = vegitableTitle
        }
    }
    
    var vegitableEngTitle: String = "" {
        didSet {
            vegitableEngLabel.text = vegitableEngTitle
        }
    }
    
    var vegitableCalTitle: String = "" {
        didSet {
            vegitableCalLabel.text = vegitableCalTitle
        }
    }
    
    let containerView: UIView = UIView()
    let vegitableImageView: UIImageView = UIImageView()
    let vegitableLabel = UILabel()
    let vegitableEngLabel = UILabel()
    let vegitableCalLabel = UILabel()
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerView.backgroundColor = .white
        vegitableImageView.contentMode = .scaleAspectFit
        vegitableImageView.image = UIImage(named: "card")
        
        vegitableLabel.textColor = .black
        vegitableLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        vegitableLabel.textAlignment = .center
        vegitableLabel.sizeToFit()
        
        vegitableEngLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        vegitableEngLabel.textColor = .init(named: "paymentEngLabel")
        vegitableEngLabel.textAlignment = .center
        vegitableEngLabel.sizeToFit()
        
        vegitableCalLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        vegitableCalLabel.textColor = .init(named: "mainOrange")
        vegitableCalLabel.textAlignment = .center
        vegitableCalLabel.sizeToFit()
        
        customAddSubView(containerView)
        containerView.customAddSubView(vegitableImageView)
        containerView.customAddSubView(vegitableLabel)
        containerView.customAddSubView(vegitableEngLabel)
        containerView.customAddSubView(vegitableCalLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: vegitableCalLabel.bottomAnchor, constant: 26),
            
            vegitableImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            vegitableImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 45),
            vegitableImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -45),
            vegitableImageView.heightAnchor.constraint(equalTo: vegitableImageView.widthAnchor),
            
            vegitableLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            vegitableLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            vegitableLabel.topAnchor.constraint(equalTo: vegitableImageView.bottomAnchor, constant: 33),
        
            vegitableEngLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            vegitableEngLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            vegitableEngLabel.topAnchor.constraint(equalTo: vegitableLabel.bottomAnchor, constant: 3),
            
            vegitableCalLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            vegitableCalLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            vegitableCalLabel.topAnchor.constraint(equalTo: vegitableEngLabel.bottomAnchor, constant: 10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//
//  PaymentButton.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class PaymentButton: UIButton {

    var paymentTitle: String = "" {
        didSet {
            paymentLabel.text = paymentTitle
        }
    }
    
    var paymentEngTitle: String = "" {
        didSet {
            paymentEngLabel.text = paymentEngTitle
        }
    }
    
    let containerView: UIView = UIView()
    let paymentImageView: UIImageView = UIImageView()
    let paymentLabel = UILabel()
    let paymentEngLabel = UILabel()
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 15
        paymentImageView.contentMode = .scaleAspectFit
        paymentImageView.image = UIImage(named: "card")
        paymentLabel.textColor = .black
        paymentLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        paymentLabel.textAlignment = .center
        paymentEngLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        paymentEngLabel.textColor = .init(named: "paymentEngLabel")
        paymentEngLabel.textAlignment = .center
        
        customAddSubView(containerView)
        containerView.customAddSubView(paymentImageView)
        containerView.customAddSubView(paymentLabel)
        containerView.customAddSubView(paymentEngLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: paymentEngLabel.bottomAnchor, constant: 26),
            
            paymentImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            paymentImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 45),
            paymentImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -45),
            paymentImageView.heightAnchor.constraint(equalTo: paymentImageView.widthAnchor),
            
            paymentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            paymentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            paymentLabel.topAnchor.constraint(equalTo: paymentImageView.bottomAnchor, constant: 33),
        
            paymentEngLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            paymentEngLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            paymentEngLabel.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant: 3),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
